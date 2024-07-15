extension StringExtension on String {
  String get image => 'assets/images/$this';
  String get lottie => 'assets/lottie/$this';
}

extension DistenanceExtension on String {
  String get kmOrM {
    double? value = double.tryParse(this);

    if (value == null) return "";

    if (value > 1000) {
      return "${double.tryParse(this)! / 1000} KM";
    } else {
      return "$this M";
    }
  }
}
