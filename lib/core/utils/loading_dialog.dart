import 'package:flutter/material.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
    builder: (BuildContext context) {
      return  const AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(), // Loading indicator
            SizedBox(width: 20), // Space between the indicator and text
            Text("Loading..."), // Loading text
          ],
        ),
      );
    },
  );
}
void closeLoadingDialog(BuildContext context) {
  Navigator.of(context).pop(); // Closes the dialog
}