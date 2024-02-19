import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/countdown/countdown_model.dart';
import '../../data/models/form/completed_records/completed_records_model.dart';
import '../../data/models/form/form_model.dart';
import '../../data/models/form/project/project_model.dart';
import '../../data/models/form/task/task_model.dart';
import '../../data/models/timer/db/timer_db_model.dart';
import '../../data/models/timer/timer_model.dart';
import 'db_helper.dart';
import 'hive_box_name_const.dart';
import 'hive_boxes.dart';

/// Hive Helper
class HiveHelper {
  /// Hive Helper Constructor
  const HiveHelper._();

  /// init is a method that is used to initialize hive.
  static Future<void> init() async {
    await Hive.initFlutter();
    await registerAdapters();
    await openBoxes();
  }

  /// close is a method that is used to close hive.
  static Future<void> close() async {
    await closeBoxes();
  }

  /// Register Adapters
  static Future<void> registerAdapters() async {
    Hive.registerAdapter<CompletedRecordsModel>(CompletedRecordsModelAdapter());
    Hive.registerAdapter<ProjectModel>(ProjectModelAdapter());
    Hive.registerAdapter<TaskModel>(TaskModelAdapter());
    Hive.registerAdapter<FormModel>(FormModelAdapter());
    Hive.registerAdapter<TimerModel>(TimerModelAdapter());
    Hive.registerAdapter<TimerDbModel>(TimerDbModelAdapter());
    Hive.registerAdapter<CountdownModel>(CountdownModelAdapter());
  }

  /// Open Boxes
  static Future<void> openBoxes() async {
    HiveBoxes.formModelBox = await DbHelper.openBox(HiveBoxNameConst.formModel);
    HiveBoxes.timerDbModelBox =
        await DbHelper.openBox(HiveBoxNameConst.timerDbModel);
  }

  /// Close Boxes
  static Future<void> closeBoxes() async {
    await DbHelper.closeBox(HiveBoxes.formModelBox);
    await DbHelper.closeBox(HiveBoxes.timerDbModelBox);
  }
}
