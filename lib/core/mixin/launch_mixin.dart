import 'package:url_launcher/url_launcher.dart';
import 'package:logger/logger.dart';

mixin LaunchMixin {
  void launchPhone(String scheme, String path) async {
    Logger logger = Logger();
    logger.d("scheme: $scheme");
    logger.d("path: $path");

    Uri phoneLaunch = Uri(
      scheme: scheme,
      path: path,
    );

    logger.d("uri: $phoneLaunch");

    if (await canLaunchUrl(phoneLaunch)) {
      await launchUrl(phoneLaunch);
    } else {
      logger.e("Could not launch $phoneLaunch");
    }
  }
}
