extension StringExtension on String {
  String get image => 'assets/images/$this';
  String get lottie => 'assets/lottie/$this';
}

extension DistenanceExtension on String {
  String get kmOrM {
    double? value = double.tryParse(this);

    if (value == null) return "";
    if (value < 1) {
      return "${(value * 1000).toStringAsFixed(2)} M";
    } else {
      return "$this KM";
    }
  }
}
