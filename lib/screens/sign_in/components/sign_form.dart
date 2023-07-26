// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy/components/loding_dialog.dart';
import 'package:shopy/screens/sign_in/login_state.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import '../../../helper/invoker.dart';
import '../../../models/cm_user.dart';
import '../../../size_config.dart';
import '../../forgot_pswd/forgot_pswd_screens.dart';
import 'form_error.dart';


class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
  //final AuthService _auth = AuthService();
  
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false  ;

  final List<String> errors = [];

  get value => null;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
        
          buildEmailFormFieldd(),
          SizedBox(height: getProportionateScreenHeight(30) ,),
           buildPasswordFormField(),
           SizedBox(height: getProportionateScreenHeight(30),),
           
           Row(
             children: [
               Checkbox(
                 value: remember, 
                 activeColor: kPrimaryColor,
                 onChanged: (value) {
                   setState(() {
                     remember = value!;
                     
                   });
                   const Spacer();
                 },
                 ),
                 const Text("Remmember me"),
                 const Spacer(),
                 GestureDetector(
                   onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),

                 
                   child: const Text("  Forgot Password",
                   style: TextStyle(decoration: TextDecoration.underline) ,
                 
                   ),
                 ),
              
                 

             ],
           ),
             
        
           FormError(errors: errors),
           const SizedBox(height: 20),
           ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()){
                _formKey.currentState?.save();
                if(email != null && password != null){
                  loading(context);
                  Invoker.post("api/v1/auth/login/", false, {
                    "email": email,
                    "password": password
                  }).then((value){
                    SharedPreferences.getInstance().then((prefs){
                      final data = value?["data"];
                      final token = data?["token"]["access_token"];
                      Navigator.of(context).pop();
                      print(token);
                      if(token != null){
                        prefs.setString("token", token);
                        Provider.of<CmUser>(context, listen: false).setUser = {
                          "id": data["id"],
                          "email": data["email"],
                          "last_name": data["last_name"],
                          "first_name": data["first_name"],
                          "phone_number": data["phone_number"],
                          "address": data["address"],
                          "vendor": (data["account_type"] == "Vender")? true: false,
                        };
              LoginState.instance.login();
            }else{
              print("error in sign in");
            }
          });
        });
   
        
      }
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
    'Sign In',
    style: TextStyle(fontSize: 20 , color: Colors.white, fontWeight: FontWeight.bold),
  ),
),        

        ],
        ),

      
    );
    
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
           obscureText: true,
           onSaved: (newValue)=> password = newValue!,
           onChanged: (value)  {
             if (value.isNotEmpty && !errors.contains(kPassNullError)) {
              setState(() {
                errors.remove(kPassNullError);
                password = value;
              });
            }
            else if (value.length >=6 &&
            !errors.contains(kShortPassError))
            {
              setState(() {
                errors.remove(kShortPassError);
                password = value;
              });
           
            }else{
              setState(() {
                password = value;
              });
            }
            
                       },
            validator: (value) {
            if(value!.isEmpty){
              return "null" ;
            }
  
            else if (value.length <6 )
            {
              setState(() {
                errors.add(kShortPassError);
              });
              
            }
            
            
            return null ;
          },
          decoration: const InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always ,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
 

          ),
        );
  }

  TextFormField buildEmailFormFieldd() {
    return TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue!,
          onChanged: (newValue) => setState(() {
            email = newValue ;
          }),
          validator: (value) {
            if(value!.isEmpty){
            return "null" ;}
            return null;
         
          },

          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always ,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
 

          ),
        );
  }
}

