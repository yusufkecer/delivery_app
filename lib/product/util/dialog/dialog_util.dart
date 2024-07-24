import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/navigation_extension.dart';
import 'package:rotation_app/core/extension/string_extension.dart';
import 'package:rotation_app/product/util/dialog/basic_dialog.dart';
import 'package:rotation_app/product/util/global/route_settings.dart';

import 'package:rotation_app/product/util/constants/asset_path.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';

mixin DialogUtil {
  void showErrorDialog(String message) {
    BuildContext? context = RoutingSettings.instance.currentContext;
    if (context == null) {
      throw Exception('Context is null');
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BasicDialog(
          buttonText: StringData.ok,
          image: AssetPath.error.image,
          title: StringData.error,
          description: message,
          onPressed: pop,
        );
      },
    );
  }

  void showGeneralError() {
    BuildContext? context = RoutingSettings.instance.currentContext;
    if (context == null) {
      throw Exception('Context is null');
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BasicDialog(
          buttonText: StringData.ok,
          image: AssetPath.error.image,
          title: StringData.error,
          description: StringData.generalError,
          onPressed: pop,
        );
      },
    );
  }

  void showSuccessDialog(String message) {
    BuildContext? context = RoutingSettings.instance.currentContext;
    if (context == null) {
      throw Exception('Context is null');
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BasicDialog(
          buttonText: StringData.ok,
          image: AssetPath.success.image,
          title: StringData.success,
          description: message,
          onPressed: pop,
        );
      },
    );
  }

  void pop() {
    BuildContext? context = RoutingSettings.instance.currentContext;
    context?.maybePop();
  }
}
