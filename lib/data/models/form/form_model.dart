import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/database/hive_type_id_consts.dart';
import '../../../domain/entities/form/form_entity.dart';
import 'project/project_model.dart';
import 'task/task_model.dart';

part 'form_model.g.dart';

/// FormModel class
@HiveType(typeId: HiveTypeIdConsts.formModel)
class FormModel {
  /// Name of the project
  @HiveField(0)
  final List<ProjectModel?>? projectModel;

  /// Description of the project
  @HiveField(1)
  final List<TaskModel?>? taskModel;

  /// FormModel constructor
  FormModel({
    required this.projectModel,
    required this.taskModel,
  });

  /// FormEntity toEntity method
  FormEntity toEntity() {
    return FormEntity(
      projects: projectModel?.map((e) => e?.toEntity()).toList(),
      tasks: taskModel?.map((e) => e?.toEntity()).toList(),
    );
  }
}
