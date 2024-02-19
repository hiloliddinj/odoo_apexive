import 'project_entity.dart';
import 'task_entity.dart';

/// FormEntity class
class FormEntity {
  /// ProjectEntity list
  final List<ProjectEntity?>? projects;

  /// TaskEntity list
  final List<TaskEntity?>? tasks;

  /// FormEntity constructor
  FormEntity({
    required this.projects,
    required this.tasks,
  });
}
