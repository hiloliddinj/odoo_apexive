// ignore_for_file: no_magic_number
/// A class that contains string utility methods.
class StringUtils {
  /// Format seconds to hours, minutes and seconds.
  static String formatSeconds(int seconds) {
    final int hours = seconds ~/ 3600;
    final int minutes = (seconds ~/ 60) % 60;
    final int remainingSeconds = seconds % 60;

    if (hours > 99) {
      return '99:59:59'; // Maximum time reached (99 hours)
    } else if (hours > 0) {
      final String hoursStr = hours.toString().padLeft(2, '0');
      final String minutesStr = minutes.toString().padLeft(2, '0');
      final String secondsStr = remainingSeconds.toString().padLeft(2, '0');

      return '$hoursStr:$minutesStr:$secondsStr';
    } else {
      final String minutesStr = minutes.toString().padLeft(2, '0');
      final String secondsStr = remainingSeconds.toString().padLeft(2, '0');

      return '$minutesStr:$secondsStr';
    }
  }
}
