import 'package:flutter/material.dart';

enum LoginStateValue { loggedOut, loggedIn, register }

class LoginState extends ChangeNotifier {
  static final instance = LoginState();

  LoginStateValue _loginState = LoginStateValue.loggedOut;
  LoginState();
  LoginStateValue get loginState => _loginState;

  login() {
    print(_loginState);
    _loginState = LoginStateValue.loggedIn;
    notifyListeners();
  }

  signup() {
    _loginState = LoginStateValue.register;
    notifyListeners();
  }

  logout() {
    _loginState = LoginStateValue.loggedOut;
    notifyListeners();
  }
}
