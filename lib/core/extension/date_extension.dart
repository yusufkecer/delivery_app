extension DateExtension on DateTime {
  String get formattedDate {
    return DateTime.parse(toString()).toString().substring(0, 10);
  }
}
