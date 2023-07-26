// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:shopy/screens/sign_up/sign_up_screens.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../newpswd/newpswd_screen.dart';
import '../../sign_in/components/form_error.dart';


class ResetForm extends StatefulWidget {
  const ResetForm({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<ResetForm> createState() => _ResetForm();
}

class _ResetForm extends State<ResetForm> {
  final _formKey = GlobalKey<FormState>();
 
  String password = "";
  String conform_password = "";
    bool remember = false  ;
  final List<String> errors = [];
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
      errors.add(error);
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
                     SizedBox(height: size.height * .1),

        // SizedBox(height: getProportionateScreenHeight(30),),
         buildPasswordField(),
          // SizedBox(height: getProportionateScreenHeight(30),),
          buildConfPasswordField(),
          // SizedBox(height: getProportionateScreenHeight(30),),
          FormError(errors: errors),
         // Spacer(),
                   //SizedBox(height: getProportionateScreenHeight(30),),
// SizedBox(height: getProportionateScreenHeight(70),),
            SizedBox(height: size.height * .1),

       Center(
           child: ElevatedButton(
                         
                    onPressed: () {
                     // Navigator.pushNamed(context, NewScreen.routeName);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return NewScreen(password: password, confirmPassword: conform_password, email: widget.email,);
          }));
  //  var _formKey;
  //  if (_formKey.currentState!.validate()) {
    
  //   _formKey.currentState!.save();}
  //  },
  // style: ElevatedButton.styleFrom(
  //   primary: Colors.deepOrangeAccent, // Background color
  // ),
    // Navigator.pushNamed(context, CartScreen.routeName);

        },
        child: const Text('Continue'),
        style: ElevatedButton.styleFrom(
    
    backgroundColor: Colors.deepOrangeAccent, 
    // Background color
  ),
      ),
                     ),
                    //  SizedBox(height: getProportionateScreenHeight(70),),
            SizedBox(height: size.height * .1),

                      const Text("Or Create a New Account",
             textAlign: TextAlign.center,
             ),

    GestureDetector(
        onTap: () {


          Navigator.pushNamed(context, SignUpScreen.routeName);

         },

 
  
  child: const Text(
    'Sign Up',
    style: TextStyle(fontSize: 15 , color: Colors.deepOrangeAccent),
  ),
  ),
  
   SizedBox(height: getProportionateScreenHeight(70),),
          //  Row(
          //    children: [
          //      Checkbox(
          //        value: remember, 
          //        activeColor: kPrimaryColor,
          //        onChanged: (value) {
          //          setState(() {
          //            remember = value!;

                     
          //          });
          //          Spacer();
          //        },
          //        ),
          //        Text("Remmember me"),
          //        Spacer(),
          //        GestureDetector(
          //          onTap: () {},

                 
                
          //        ),
              
                 

          //    ],
          //  ),
          //  SizedBox(height: getProportionateScreenHeight(30),),
             
    //Spacer(),
//           ElevatedButton(
//             onPressed: () {
                         
//      if (_formKey.currentState!.validate()) {
//      //Navigator.pushNamed(context, CompleteProfileScreen.routeName);
//       _formKey.currentState!.save();}
//       if( password != null && password == conform_password){
//         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) {
//           return ()
//         })));
// // Navigator.pushNamed(context, CompleteProfileScreen.routeName);
//       }
     


//   },
//   style: ElevatedButton.styleFrom(
//     primary: Colors.deepOrangeAccent, // Background color
//   ),
//   child: const Text(
//     'Sign Up',
//     style: TextStyle(fontSize: 15, color: Colors.white),
//   ),
// ),
                    
                       //if (_formKey.currentState!.validate()) {
                       //  Navigator.pushNamed(context, CompleteProfileScreen.routeName);

            // _formKey.currentState!.save();
              
            //  }

             
             
        ],
      ),
      
      
      
    );
    
  }
  
//          style: ElevatedButton.styleFrom(
    
//     primary: Colors.deepOrangeAccent, 
//     // Background color
//   ),
  
//   child: const Text(
//     'Sign In',
//     style: TextStyle(fontSize: 15 , color: Colors.white),
//   ),
// ),
  
  

  TextFormField buildConfPasswordField() {
    return TextFormField(
         obscureText: true,
         onSaved: (newValue)=> conform_password = newValue!,
          onChanged: (value)  {

            if (password == conform_password && !errors.contains(kMatchPassError)) {
            setState(() {
              errors.remove(kMatchPassError);
              conform_password = value;


            });
          }
         else if (value.length >=8 && 
         !errors.contains(kShortPassError))
          {
         setState(() {
            errors.remove(kShortPassError);
            conform_password = value;

           });
         
         }
          setState(() {
            conform_password = value;
            
          });
          
          return;
          },
          validator: (value) {
 if(value!.isEmpty){
          return "null" ;}
         else if (value.isEmpty && !errors.contains(kPassNullError)) {
            setState(() {
              errors.add(kPassNullError);
            });
          
          }
         else if (password != conform_password  && 
          !errors.contains(kMatchPassError))
          {
            setState(() {
              errors.add(kMatchPassError);
            });
            
          }
          
          
          return null ;
       },
        decoration: const InputDecoration(
          labelText: " Confirm Password",
          hintText: "Re-enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always ,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
 

        ),
     );
     
  }

  TextFormField buildPasswordField() {
    return TextFormField(
         obscureText: true,
         onSaved: (newValue)=> password = newValue!,
                 onChanged: (value){
          if (mounted){
            setState(() {
              password = value;
            print(password);
            });
          }
        },
        // onChanged: (value)  {
          // if (value.isNotEmpty && !errors.contains(kPassNullError)) {
          //  setState(() {
           //  errors.remove(kPassNullError);
          // });
        // }
         // else if (value.length >=8 && 
         //!errors.contains(kShortPassError))
        // {
          // setState(() {
             //errors.remove(kShortPassError);
           //});
         
         //}
          
          
          // return null ;
         // },
          validator: (value) {
 if(value!.isEmpty){
          return "" ;}
         else if (value.isEmpty && !errors.contains(kPassNullError)) {
            setState(() {
              errors.add(kPassNullError);
            });
          
          }
          else if (value.length <8 && 
          !errors.contains(kShortPassError))
          {
            setState(() {
              errors.add(kShortPassError);
            });
            
          }
          
          
          return null ;
        },
        decoration: const InputDecoration(
          labelText: " Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always ,
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
 

        ),
        
        
);

  }

  
       
          
        
  }
