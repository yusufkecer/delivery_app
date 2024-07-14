import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/string_extension.dart';
import 'package:rotation_app/core/global/key.dart';
import 'package:rotation_app/product/util/constants/image_path.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog_view.dart';

mixin DialogUtil {
  void showErrorDialog(String message) {
    BuildContext? context = GlobalKeyManager.instance.key.currentContext;
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
    BuildContext? context = GlobalKeyManager.instance.key.currentContext;
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
    BuildContext? context = GlobalKeyManager.instance.key.currentContext;
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
    BuildContext? context = GlobalKeyManager.instance.key.currentContext;
    Navigator.of(context!).pop();
  }
}
