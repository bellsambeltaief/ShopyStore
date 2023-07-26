import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/helper/invoker.dart';
import 'package:shopy/models/cm_product.dart';
import 'package:shopy/models/cm_user.dart';
import 'package:shopy/screens/home/home_screen.dart';
import 'package:shopy/screens/myaccount/myaccount_screen.dart';
import 'package:shopy/screens/profile/components/profile_menu.dart';
import 'package:shopy/screens/profile/components/profile_pic.dart';
import 'package:shopy/screens/sign_in/login_state.dart';
import 'package:shopy/screens/vendor_space/vendor_space_screen.dart';




class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    var user = Provider.of<CmUser>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children:           (user.isVendor)?
            [
          const ProfilePic(),
          const SizedBox(height: 20,),
   
          ProfileMenu(
            icon: "assets/icons/User Icon.svg" ,
            text: "My Account",
            press: (){
             // Navigator.popAndPushNamed(context, MyaccountScreen.routeName);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const MyaccountScreen();
              }));
            },
          ),
          ProfileMenu(
            icon: "assets/icons/vendor.svg" ,
            text: "Vendor Space",
            press: (){

              Invoker.get('/api/v1/product/get-product-by-vendor/', false, query: {
                "vendor_id": user.id.toString()
              }).then((value){

                VendorProduct product = Provider.of<VendorProduct>(context, listen: false);
                product.products = (value["queryset"] as List<dynamic>).map(
                        (e)=>int.parse(e["id"].toString())
                ).toList() ;

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const VendorScreen();
                }));
              });
            },
          ),
              
        
           ProfileMenu(
            icon: "assets/icons/Settings.svg" ,
            text: "Settings",
            press: (){},
          ),

           ProfileMenu(
            icon: "assets/icons/Question mark.svg" ,
            text: "Help Center",
            press: (){},
          ),
           ProfileMenu(
            icon: "assets/icons/Log out.svg" ,
            text: "Log Out",
            press: (){
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
              LoginState.instance.logout();
              Provider.of<CmUser>(context, listen: false).logout();
              LoginStateValue.loggedOut;
            },
          ),
          
        ]:[
          const ProfilePic(),
          const SizedBox(height: 20,),
   
          ProfileMenu(
            icon: "assets/icons/User Icon.svg" ,
            text: "My Account",
            press: (){
           
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const MyaccountScreen();
              }));
            },
          ),
              
      
           ProfileMenu(
            icon: "assets/icons/Settings.svg" ,
            text: "Settings",
            press: (){},
          ),

           ProfileMenu(
            icon: "assets/icons/Question mark.svg" ,
            text: "Help Center",
            press: (){},
          ),
           ProfileMenu(
            icon: "assets/icons/Log out.svg" ,
            text: "Log Out",
            press: (){
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
              LoginState.instance.logout();
              Provider.of<CmUser>(context, listen: false).logout();

              LoginStateValue.loggedOut;
            },
          ),
          
        ],
      ),
    );
  }
}

