import 'package:rotation_app/core/extension/logger_extension.dart';
import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  void launchPhone(String scheme, String path) async {
    Uri phoneLaunch = Uri(
      scheme: scheme,
      path: path,
    );

    if (await canLaunchUrl(phoneLaunch)) {
      await launchUrl(phoneLaunch);
    } else {
      "Could not launch $phoneLaunch".logError;
    }
  }
}
