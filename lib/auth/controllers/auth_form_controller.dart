import 'package:flutter/material.dart';

class AuthFormController {
  void showErrorDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Ocorreu um erro"),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Entendido"),
          )
        ],
      ),
    );
  }

  void submit(
    Map<String, String> authData,
    GlobalKey<FormState> formKey,
    Function(Map<String, String>) onSubmit,
    Function() onSetState,
  ) async {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    onSetState();

    formKey.currentState?.save();

    onSubmit(authData);
  }

  void showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
