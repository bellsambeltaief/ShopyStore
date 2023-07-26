

import 'package:flutter/material.dart';

void loading(BuildContext context) async{
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (builder){
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 15,),
                Text('Loading...')
              ],
            ),
          ),
        );
      });
}