import 'package:flutter/material.dart';

void loading(BuildContext context) async {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (builder) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                Text('Loading...')
              ],
            ),
          ),
        );
      });
}
