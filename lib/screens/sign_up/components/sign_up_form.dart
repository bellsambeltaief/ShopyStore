// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shopy/screens/complete_profile/complete_profile_screens.dart';
import 'package:shopy/size_config.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import '../../sign_in/components/form_error.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conformPassword;
  final List<String> errors = [];
  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildConfPasswordField(),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          ElevatedButton(
            onPressed: () {
              print(_formKey.currentState!.validate());
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              if (email != null &&
                  password != null &&
                  password == conformPassword) {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: ((context) {
                  return CompleteProfileScreen(
                    email: email!,
                    password: password!,
                    confirmPassword: conformPassword!,
                  );
                })));
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              fixedSize: const Size(350, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            child: const Text(
              'Complete Your registration',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildConfPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conformPassword = newValue!,
      onChanged: (value) {
        if (password == conformPassword && !errors.contains(kMatchPassError)) {
          setState(() {
            errors.remove(kMatchPassError);
            password = value;
          });
        } else if (value.length >= 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
            password = value;
          });
        }
        setState(() {
          password = value;
        });

        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "null";
        } else if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (password != conformPassword &&
            !errors.contains(kMatchPassError)) {
          setState(() {
            errors.add(kMatchPassError);
          });
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: " Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (mounted) {
          setState(() {
            password = value;
            print(password);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: " Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      initialValue: '',
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (mounted) {
          setState(() {
            email = value;
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "";
        } else if (value.isNotEmpty) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
