import '../globals/intl.dart';

extension GSDateTime on DateTime {
  String get formattedDate {
    return dateFormat.format(this);
  }
}
