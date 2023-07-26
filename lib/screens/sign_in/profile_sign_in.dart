import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shopy/screens/sign_in/sign_in_screen.dart';
import '../profile/profile_screen.dart';
import '../sign_up/sign_up_screens.dart';
import 'login_state.dart';

class ProfileSignIn extends StatelessWidget {
  const ProfileSignIn({ Key? key }) : super(key: key);
  static const routeName = "/profileScreen";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value:LoginState.instance, builder: (context, _){
      return Consumer<LoginState>(builder: (context, state, _){
        switch(state.loginState){
          case LoginStateValue.loggedOut:
            return const SignInScreen();
          case LoginStateValue.loggedIn:
            return const ProfileScreen();
          case LoginStateValue.register:
            return const SignUpScreen();
        }
      },);
    },);
  }
}
