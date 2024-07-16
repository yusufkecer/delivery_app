import 'package:flutter/foundation.dart';

@immutable
final class ApiUrl {
  const ApiUrl._();

  static const String baseUrl = 'https://669373ecc6be000fa07b98b6.mockapi.io/delivery/';
  static const String taks = 'tasks';
  static const String mapUrl = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  static const List<String> subdomains = ['a', 'b', 'c'];
}
