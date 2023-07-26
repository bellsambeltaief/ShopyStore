import 'package:flutter/material.dart';
import 'package:shopy/screens/notifications/components/body.dart';





class NotifScreen extends StatelessWidget {
  static String routeName = '/notif';

  const NotifScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SizedBox(
          width: 250,
          child: Text("Notifications" ,
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),),
        ),

      ),
      body: const Body(),
       
     );
  }
}
