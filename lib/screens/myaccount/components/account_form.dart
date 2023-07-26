import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/constants.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../models/cm_user.dart';
import '../../../size_config.dart';
import '../../login_scuccess/login_success_screens.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({Key? key}) : super(key: key);
  @override
  State<AccountForm> createState() => _AccountForm();
}


class _AccountForm extends State< AccountForm> {
  late CmUser user;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String email;
  late String firstName;
  late String lastName;
   void addError({required String error}){
    if (!errors.contains(error)) {
      setState(() {
      errors.add(error);
    });
    }
  }
  void removeError({required String error}){
    if (errors.contains(error)) {
      setState(() {
      errors.remove(error);
    });
    }
  }

  
  @override
  Widget build(BuildContext context) {
    user = Provider.of<CmUser>(context, listen: false);
    return Form(
      key: _formKey ,
      child: Column(

        children: [
           SizedBox(height:
         getProportionateScreenHeight(30),
        ),
         
         SizedBox(height:
         getProportionateScreenHeight(30),
        ),
        buildFirstNameFormField(),
        SizedBox(height:
         getProportionateScreenHeight(30),
        ),
        buildLastNameFormField(),
         SizedBox(height:
         getProportionateScreenHeight(30),
        ),
         buildEmailField(),  
          SizedBox(height: getProportionateScreenHeight(30),),

        SizedBox(height:
         getProportionateScreenHeight(30),),
       
       ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, LoginSuccessScreen.routeName);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrangeAccent, // Background color
        ),
        child: const Text(
          'Save',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
                              // Navigator.pushNamed(context, OtpScreen.routeName);

        ],
      ),
      
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
        
        onSaved: (newValue) => firstName = newValue!,
        onChanged: (value){
          user.setFirstName = value;
        },
        validator: (value) {
          if(value!.isEmpty){
          return "null" ;}

          else if (value.isEmpty && !errors.contains(kNameNullError)) {
            setState(() {
              errors.add(kNameNullError);
            });}
          return null ;
        },

        initialValue: user.getFirstName,
        decoration: const InputDecoration(
          labelText: "FirstName",
          // hintText: "Balsem",
          floatingLabelBehavior: FloatingLabelBehavior.always ,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),

        ),
      );
  }


  TextFormField buildLastNameFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        initialValue: user.getLastName,
        onChanged: (value){
          user.setLastName = value;
        },
        onSaved: (newValue) => firstName = newValue!,
          validator: (value) {
          if(value!.isEmpty){
          return "null" ;}

          else if (value.isEmpty && !errors.contains(kNameNullError)) {
            setState(() {
              errors.add(kNameNullError);
            });}
          return null ;
        },






        decoration: const InputDecoration(
          labelText: "Last Name",
          // hintText: "Beltaief",
          floatingLabelBehavior: FloatingLabelBehavior.always ,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
 

        ),
      );
  }
      TextFormField buildEmailField() {
    return TextFormField(
      initialValue: user.getEmail,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          user.setEmail = value;
        },
        onSaved: (newValue) => email = newValue!,
          validator: (value) {
          if(value!.isEmpty){
          return "null" ;}

          else if (value.isEmpty && !errors.contains(kNameNullError)) {
            setState(() {
              errors.add(kNameNullError);
            });}
          return null ;
        },
      
        decoration: const InputDecoration(
          labelText: "Email",
         // hintText: "balsembeltaief90@gmail.com",
          floatingLabelBehavior: FloatingLabelBehavior.always ,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
 

        ),
        );
  }
}


