import '../globals/intl.dart';

extension WBDateTime on DateTime {
  String get formattedDate {
    return dateFormat.format(this);
  }
}
