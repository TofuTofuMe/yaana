import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String message;

  const LoadingDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
      title: Center(child: Text(message)),
      children: [Center(child: CircularProgressIndicator())],
    );
  }
}
