import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  IconThemeData get iconTheme => theme.iconTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  NavigatorState get navigator => Navigator.of(this);
  double get width => mediaQuery.size.width;
  double get height => mediaQuery.size.height;
}
