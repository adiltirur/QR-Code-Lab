import '../globals/intl.dart';

extension TDDateTime on DateTime {
  String get formattedDate {
    return dateFormat.format(this);
  }
}
