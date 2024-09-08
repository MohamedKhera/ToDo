import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          alignment: AlignmentDirectional.center,
          content: SizedBox(
            height: 40,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  static void showMessageDialog(
      {required BuildContext context,
      required String message,
      required void Function() onPress}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: AlignmentDirectional.center,
          content: SizedBox(
            height: 40,
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            TextButton(
              onPressed: onPress,
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
