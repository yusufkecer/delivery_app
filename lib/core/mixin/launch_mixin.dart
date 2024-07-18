import 'package:url_launcher/url_launcher.dart';
import 'package:logger/logger.dart';

//!fix this
mixin LaunchMixin {
  void launchPhone(String scheme, path) {
    Logger logger = Logger();
    logger.d("scheme: $scheme");
    logger.d("path: $path");
    Uri phoneLaunch = Uri(
      scheme: "55555",
      path: path,
      queryParameters: <String, String>{
        'body': Uri.encodeComponent('Example Subject & Symbols are allowed!'),
      },
    );
    logger.d("uri: $phoneLaunch");
    launchUrl(phoneLaunch);
  }
}
