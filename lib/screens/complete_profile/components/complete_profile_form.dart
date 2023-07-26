import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy/components/loding_dialog.dart';
import 'package:shopy/screens/sign_in/login_state.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import '../../../helper/invoker.dart';
import '../../../size_config.dart';
import '../../sign_in/components/form_error.dart';
import '../../sign_in/profile_sign_in.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm(
      {Key? key,
      required this.email,
      required this.password,
      required this.confirmPassword})
      : super(key: key);
  final String email;
  final String password;
  final String confirmPassword;
  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  bool remember = false;
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
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),

            buildFirstNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildLastNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildPhoneFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildAdressFormField(),
            //  SizedBox(height:
            //  getProportionateScreenHeight(30),
            // ),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                const Text("I am  a Store Owner"),
                const Spacer(),
              ],
            ),

            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),

            ElevatedButton(
              onPressed: () {
                if (address != null &&
                    phoneNumber != null &&
                    firstName != null &&
                    lastName != null) {
                  loading(context);
                  debugPrint("sending post request ...");
                  Invoker.post("api/v1/auth/register/", false, {
                    "email": widget.email,
                    "password": widget.password,
                    "confirm_password": widget.confirmPassword,
                    "first_name": firstName,
                    "last_name": lastName,
                    "address": address,
                    "phone_number": phoneNumber,
                    "account_type": remember ? "Vender" : "User",
                  }).then((value) {
                    Navigator.of(context).pop();
                    if ((value as Map<String, dynamic>)
                        .keys
                        .contains("email")) {
                      // print(value);
                      final snackBar = SnackBar(
                        content: Text((value)["email"][0]),
                        action: SnackBarAction(
                          label: 'ok',
                          textColor: Colors.deepOrangeAccent,
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      SharedPreferences.getInstance().then((prefs) {
                        prefs.setString("token", value["token"]);
                        LoginState.instance.login();
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                          return const ProfileSignIn();
                        }));
                      });
                    }
                  });
                  // http.post(
                  //     Uri.http("172.20.10.2:8000", "api/v1/auth/register/"),
                  //     body: {
                  //       "email": widget.email,
                  //       "password": widget.password,
                  //       "confirm_password": widget.confirmPassword,
                  //       "first_name": firstName,
                  //       "last_name": lastName,
                  //       "address": address,
                  //       "phone_number": phoneNumber
                  //     }).then((value) {
                  //   print(value.body);
                  //   Navigator.pushNamed(context, OtpScreen.routeName);
                  // });
                } else {
                  debugPrint("nope");
                  debugPrint(lastName);
                  debugPrint(firstName);
                  debugPrint(phoneNumber);
                  debugPrint(address);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                fixedSize: const Size(350, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onChanged: (newValue) => setState(() {
        firstName = newValue;
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return "null";
        } else if (value.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "FirstName",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (newValue) => setState(() {
        lastName = newValue;
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return "null";
        } else if (value.isEmpty && !errors.contains(kNameNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      onChanged: (newValue) => setState(() {
        phoneNumber = newValue;
      }),
      validator: (value) {
        if (value!.isEmpty) {
          return "null";
        } else if (value.isEmpty && !errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.add(kNameNullError);
          });
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildAdressFormField() {
    return TextFormField(
      onChanged: (newValue) => setState(() {
        address = newValue;
      }),
      decoration: const InputDecoration(
        labelText: "Address ",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }
}
