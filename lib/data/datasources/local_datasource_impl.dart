// ignore_for_file: no_magic_number
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odoo_apexive/data/models/form/completed_records/completed_records_model.dart';
import 'package:odoo_apexive/data/models/form/form_model.dart';
import 'package:odoo_apexive/data/models/form/project/project_model.dart';
import 'package:odoo_apexive/domain/entities/timer/timer_entity.dart';

import '../../core/database/hive_box_name_const.dart';
import '../../core/database/hive_boxes.dart';
import '../models/countdown/countdown_model.dart';
import '../models/form/task/task_model.dart';
import '../models/timer/db/timer_db_model.dart';
import '../models/timer/timer_model.dart';
import 'local_datasource.dart';

/// This is a class that implements CacheLocalDatasource abstract class.
/// This class is used to get data from API.
class LocalDatasourceImpl implements LocalDatasource {
  @override
  Future<FormModel?> getFormModel() async {
    FormModel? formModel =
        HiveBoxes.formModelBox?.get(HiveBoxNameConst.formModel);

    if ((formModel?.projectModel?.isNotEmpty ?? false) &&
        (formModel?.taskModel?.isNotEmpty ?? false)) {
      return formModel;
    }

    final List<ProjectModel?> localProjects = [];
    final List<TaskModel?> localTasks = [];
    for (var i = 1; i <= 5; i++) {
      localProjects.add(
        ProjectModel(
          id: i,
          name: 'Project $i',
          description: 'Description $i',
          time: DateTime.now().add(
            Duration(days: i * 2),
          ),
          countdownModel: CountdownModel(
            id: i,
            seconds: 0,
            isTicking: false,
          ),
          completedRecords: [],
        ),
      );

      localTasks.add(
        TaskModel(
          id: i,
          title: 'Task $i',
          description: 'Description $i',
          time: DateTime.now().add(
            Duration(days: i * 2),
          ),
          assignedTo: 'Name Surname $i',
        ),
      );
    }

    formModel = FormModel(
      projectModel: localProjects,
      taskModel: localTasks,
    );

    await saveFormModel(formModel: formModel);

    return formModel;
  }

  @override
  Future<void> saveFormModel({required FormModel? formModel}) async {
    if (formModel == null) return;
    await HiveBoxes.formModelBox?.put(
      HiveBoxNameConst.formModel,
      formModel,
    );
  }

  @override
  Future<void> submitTimer({required TimerModel? timerModel}) async {
    if (timerModel == null) return;
    final timerDbModels = await getTimers();
    timerDbModels.add(timerModel);
    final timerDbModel = TimerDbModel(timers: timerDbModels);
    await HiveBoxes.timerDbModelBox?.put(
      HiveBoxNameConst.timerDbModel,
      timerDbModel,
    );
  }

  @override
  Future<List<TimerModel?>> getTimers() async {
    final timerDbModel =
        HiveBoxes.timerDbModelBox?.get(HiveBoxNameConst.timerDbModel);

    return timerDbModel?.timers ?? [];
  }

  @override
  ValueListenable<Box<TimerDbModel?>>? getTimersStream() {
    final timerDbModel = HiveBoxes.timerDbModelBox?.listenable(
      keys: [HiveBoxNameConst.timerDbModel],
    );

    return timerDbModel;
  }

  @override
  Future<void> completeRecord({
    required TimerModel? timerModel,
    required CompletedRecordsModel? completedRecordsModel,
  }) async {
    if (timerModel == null) return;
    final timerDbModels = await getTimers();
    timerDbModels
        .firstWhereOrNull(
          (element) => element?.projectModel?.id == timerModel.projectModel?.id,
        )
        ?.projectModel
        ?.completedRecords
        ?.add(completedRecordsModel);
    final timerDbModel = TimerDbModel(timers: timerDbModels);
    await HiveBoxes.timerDbModelBox?.put(
      HiveBoxNameConst.timerDbModel,
      timerDbModel,
    );
  }

  @override
  void tick(TimerEntity? timerEntity) {
    if (timerEntity == null) return;
    final box = HiveBoxes.timerDbModelBox;
    final timerDbModel = box?.get(HiveBoxNameConst.timerDbModel);
    final timerModel = timerDbModel?.timers?.firstWhereOrNull(
      (element) => element?.projectModel?.id == timerEntity.projectEntity?.id,
    );
    if (timerModel == null) return;

    final newTimerEntity = timerModel.copyWith(
      projectModel: timerModel.projectModel?.copyWith(
        countdownModel: timerModel.projectModel?.countdownModel?.copyWith(
          seconds: (timerModel.projectModel?.countdownModel?.seconds ?? 0) + 1,
        ),
      ),
    );

    final index = timerDbModel?.timers?.indexOf(timerModel);
    timerDbModel?.timers?.removeAt(index ?? 0);
    timerDbModel?.timers?.insert(index ?? 0, newTimerEntity);

    box?.put(HiveBoxNameConst.timerDbModel, timerDbModel);
  }

  @override
  Future<void> setTick(TimerEntity? timerEntity) async {
    if (timerEntity == null) return;
    final box = HiveBoxes.timerDbModelBox;
    final timerDbModel = box?.get(HiveBoxNameConst.timerDbModel);
    final timerModel = timerDbModel?.timers?.firstWhereOrNull(
      (element) => element?.projectModel?.id == timerEntity.projectEntity?.id,
    );
    if (timerModel == null) return;

    final newTimerEntity = timerModel.copyWith(
      projectModel: timerModel.projectModel?.copyWith(
        countdownModel: timerModel.projectModel?.countdownModel?.copyWith(
          isTicking:
              !(timerModel.projectModel?.countdownModel?.isTicking ?? false),
        ),
      ),
    );

    final index = timerDbModel?.timers?.indexOf(timerModel);
    timerDbModel?.timers?.removeAt(index ?? 0);
    timerDbModel?.timers?.insert(index ?? 0, newTimerEntity);

    await box?.put(HiveBoxNameConst.timerDbModel, timerDbModel);
  }
}
