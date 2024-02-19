/// This code creates a list of Hive type IDs for use when initializing Hive.
/// It's important to use Hive type IDs when initializing Hive, because Hive
/// needs to know what type of data is stored in each box.
class HiveTypeIdConsts {
  /// Form Model
  static const formModel = 0;

  /// Project Model
  static const completedRecords = 1;

  /// Project Model
  static const projectModel = 2;

  /// Task Model
  static const taskModel = 3;

  /// Timer Model
  static const timerModel = 4;

  /// Timer Db Model
  static const timerDbModel = 5;

  /// Count Down Model
  static const countDownModel = 6;
}
