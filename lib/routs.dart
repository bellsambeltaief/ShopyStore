import 'package:shopy/screens/adminmanage/admin_screen.dart';
import 'package:shopy/screens/cart/cart_screen.dart';
import 'package:shopy/screens/complete_profile/complete_profile_screens.dart';
import 'package:shopy/screens/details/details_screen.dart';
import 'package:shopy/screens/favoris/favoris_screen.dart';
import 'package:shopy/screens/forgot_pswd/forgot_pswd_screens.dart';
import 'package:shopy/screens/home/home_screen.dart';
import 'package:shopy/screens/login_scuccess/login_success_screens.dart';
import 'package:shopy/screens/notifications/notif_screen.dart';
import 'package:shopy/screens/otp/otp_screen.dart';
import 'package:shopy/screens/payme/payme_screen.dart';
import 'package:shopy/screens/produits/prod_screen.dart';
import 'package:shopy/screens/profile/profile_screen.dart';
import 'package:shopy/screens/sign_in/payment_sign_in.dart';
import 'package:shopy/screens/sign_in/profile_sign_in.dart';
import 'package:shopy/screens/sign_in/sign_in_screen.dart';
import 'package:shopy/screens/sign_up/sign_up_screens.dart';
import 'package:shopy/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(), 
  ForgotPasswordScreen.routeName:(context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) =>  const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName : (context) => const CompleteProfileScreen(email: "", password: "", confirmPassword: ""),
  ProfileSignIn.routeName: (context) => const ProfileSignIn(),
  PaymentSignIn.routeName: (context) => const PaymentSignIn(),
  HomeScreen.routeName : (context) =>  const HomeScreen(),
  DetailsScreen.routeName : (context) => const DetailsScreen(),
  CartScreen.routeName : (context) => const CartScreen(),
  ProfileScreen.routeName : (context) => const ProfileScreen(),
  AdminScreen.routeName : (context) => const AdminScreen(),
  NotifScreen.routeName : (context) => const NotifScreen(),
  PaymentScreen.routeName :(context) => const PaymentScreen(),
  FavoriteScreen.routeName :(context) => const FavoriteScreen(),
  OtpScreen.routeName : (context) => const OtpScreen(),
  ProduitScreen.routeName :(context) => const ProduitScreen(),


};



