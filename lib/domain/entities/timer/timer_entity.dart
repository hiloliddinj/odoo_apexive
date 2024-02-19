import '../form/project_entity.dart';
import '../form/task_entity.dart';

/// TimerEntity class
class TimerEntity {
  /// Id of the project
  final int id;

  /// Name of the project
  final ProjectEntity? projectEntity;

  /// Description of the project
  final TaskEntity? taskEntity;

  /// Description of the project
  final String? description;

  /// Flag to check if the project is favorite
  final bool? isFavorite;

  /// TimerEntity constructor
  TimerEntity({
    required this.id,
    required this.projectEntity,
    required this.taskEntity,
    required this.description,
    required this.isFavorite,
  });
}
