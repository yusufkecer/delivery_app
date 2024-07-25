import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/navigation_extension.dart';
import 'package:rotation_app/core/extension/string_extension.dart';
import 'package:rotation_app/product/util/dialog/basic_dialog.dart';
import 'package:rotation_app/product/util/dialog/confirm_dialog.dart';
import 'package:rotation_app/product/util/global/routing_settings.dart';

import 'package:rotation_app/product/util/constants/asset_path.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';

mixin DialogUtil {
  Completer<bool?> completer = Completer();

  void showErrorDialog(String message, {dissmissable = true, void Function()? onPressed, String? bttnTxt}) {
    BuildContext? context = RoutingSettings.instance.currentContext;
    if (context == null) {
      throw Exception('Context is null');
    }
    onPressed ??= pop;
    bttnTxt ??= StringData.ok;
    showDialog(
      barrierDismissible: dissmissable,
      context: context,
      builder: (BuildContext context) {
        return BasicDialog(
          buttonText: bttnTxt!,
          asset: AssetPath.error.image,
          title: StringData.error,
          description: message,
          onPressed: onPressed!,
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
          asset: AssetPath.error.image,
          title: StringData.error,
          description: StringData.generalError,
          onPressed: pop,
        );
      },
    );
  }

  void showSuccessDialog(String message, {void Function()? onPressed}) {
    BuildContext? context = RoutingSettings.instance.currentContext;
    if (context == null) {
      throw Exception('Context is null');
    }
    onPressed ??= pop;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BasicDialog(
          isAnimated: true,
          buttonText: StringData.ok,
          asset: AssetPath.success.lottie,
          title: StringData.success,
          description: message,
          onPressed: onPressed!,
        );
      },
    );
  }

  Future<bool?> showConfirmDialog({
    required String description,
    Function()? onConfirm,
    Function()? onCancel,
    String title = StringData.areYouSure,
    String buttonText = StringData.yes,
    String cancelText = StringData.cancel,
  }) async {
    onCancel ??= pop;
    onConfirm ??= confirm;
    BuildContext? context = RoutingSettings.instance.currentContext;
    if (context == null) {
      throw Exception('Context is null');
    }
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDialog(
          title: title,
          buttonText: buttonText,
          cancelText: cancelText,
          description: description,
          onPressed: onConfirm!,
          onCancel: onCancel,
        );
      },
    );

    return completer.future;
  }

  void confirm() {
    BuildContext? context = RoutingSettings.instance.currentContext;
    context?.maybePop();
    completer.complete(true);
  }

  void pop() {
    BuildContext? context = RoutingSettings.instance.currentContext;
    context?.maybePop();
    completer.complete(false);
  }
}
