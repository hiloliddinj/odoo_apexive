// ignore_for_file: avoid_global_state
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/storage_keys.dart';

/// DbHelper is a class that is used to save data to local storage.
class DbHelper {
  /// ciper is a variable that is used to set the HiveAesCipher.
  static HiveAesCipher? ciper;

  /// getEncryptedKey is a method that is used to get encrypted key.
  /// Example: await DbHelper().getEncryptedKey();
  static Future<Uint8List> _getEncryptedKey() async {
    final secureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions.defaultOptions
          .copyWith(encryptedSharedPreferences: true),
    );
    final encryptionKey = await secureStorage.read(
      key: StorageKeys.appStorageKey,
    );
    if (encryptionKey == null) {
      final key = Hive.generateSecureKey();
      await secureStorage.write(
        key: StorageKeys.appStorageKey,
        value: base64UrlEncode(key),
      );
    }
    final key = await secureStorage.read(
      key: StorageKeys.appStorageKey,
    );

    return base64Url.decode(key ?? '');
  }

  /// openBox is a method that is used to open a box.
  static Future<Box<T>?> openBox<T>(String boxName) async {
    ciper ??= HiveAesCipher(await _getEncryptedKey());

    return Hive.openBox(
      boxName,
      encryptionCipher: ciper,
    );
  }

  /// closeBox is a method that is used to close a box.
  static Future<void> closeBox(Box<dynamic>? box) async {
    await box?.close();
  }
}
