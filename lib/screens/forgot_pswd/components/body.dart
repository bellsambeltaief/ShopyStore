import 'package:flutter/material.dart';
import 'package:shopy/components/no_account_text.dart';
import 'package:shopy/helper/invoker.dart';
import 'package:shopy/screens/sign_in/components/form_error.dart';
import 'package:shopy/size_config.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import '../../reset/reset_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  

  @override 
  Widget build(BuildContext context) {
    return SizedBox(
      
      width: double.infinity ,
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),),
          child: Column(
            
            children: [
              SizedBox(height: getProportionateScreenHeight(50),),
          
              Text("Forgot Password", style: TextStyle(fontSize: getProportionateScreenWidth(28),
              color: Colors.black,
              fontWeight: FontWeight.bold,
              ),
              
              ),
              const Text("Please enter your email and we will send \n you a link to return to your account",
              textAlign: TextAlign.center ,
            
              ),
            
              
              SizedBox(height: getProportionateScreenHeight(70),),
              const ForgotPassForm(),
      
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email = "";
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Form(
    key: _formKey,
      
      child: Column(
        
        children: [
        
          TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue!,
          onChanged: (newValue){
            email = newValue;
            if (value.isNotEmpty && !errors.contains(kEmailNullError)) {
              setState(() {
                errors.remove(kEmailNullError);
              });
            }
            else if (emailValidatorRegExp.hasMatch(value) && 
            !errors.contains(kInvalidEmailError))
            {
              setState(() {
                errors.remove(kInvalidEmailError);
              });
            }
            return;
          },
          validator: (value) {
            if (value!.isEmpty && !errors.contains(kEmailNullError)) {
              setState(() {
                errors.add(kEmailNullError);
              });
            }
            else if (emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError))
            {
              setState(() {
                errors.add(kInvalidEmailError);
              });
            }
            return null ;
          },
          
          

          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always ,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg",  ),

          ),
          ),
          
          SizedBox(height: getProportionateScreenHeight(70),),
          FormError(errors: errors),
        
          SizedBox(height:  SizeConfig.screenHeight = 3.9,),
          ElevatedButton(
            onPressed: () {
              if(email != "") {
                Invoker.post("api/v1/auth/forgot-password/", false, {
                "email": email
              }).then((value){
                if( (value as Map<String, dynamic>).keys.contains("detail")) {
                  final snackBar = SnackBar(
                    content: const Text('This email is invalid'),
                    action: SnackBarAction(

                      label: 'ok',
                      textColor: Colors.deepOrangeAccent,
                      onPressed: () {

                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);


                }else{
                  // Navigator.pushNamed(context, ResetScreen.routeName);
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ResetScreen(email: email);
                  }));

                }

                  if (_formKey.currentState!.validate()) {

                    _formKey.currentState!.save();}
                });

              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrangeAccent,
               // Background color
            ),
            child: const Text(

                'Continue',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),

               
             
                   // if (_formKey.currentState!.validate()) {

               // _formKey.currentState!.save();
            //  }

                    const NoAccountText(),
             
        ],
        
        
      ),
      
      
    );
    
  }
}