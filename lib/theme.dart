
// ignore_for_file: deprecated_member_use, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
 
import 'constants.dart';


ThemeData theme(){
    
   return ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        appBarTheme: appBarTheme(),
        textTheme: const TextTheme(),
        inputDecorationTheme: const InputDecorationTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
   );
}
             
             InputDecorationTheme inputDecorationTheme() {

               OutlineInputBorder outlineInputBorder = OutlineInputBorder(
                 borderRadius: BorderRadius.circular(28),
                 borderSide: const BorderSide(color: kTextColor),
                 gapPadding: 10,

               ) ;
               return InputDecorationTheme(
                 labelStyle: const TextStyle(color: Colors.deepOrangeAccent),
                 hintStyle: const TextStyle(color: Colors.deepOrangeAccent),
                 contentPadding: const EdgeInsets.symmetric(horizontal: 42 , vertical: 20),
                 enabledBorder: outlineInputBorder,
                 focusedBorder: outlineInputBorder,
               );
             }

            
       // visualDensity: VisualDensity.adaptivePlatformDensity,
        
        
   
 
 TextTheme textTheme() {
   return const TextTheme(
     bodyText1: TextStyle(color:  kTextColor),
     bodyText2: TextStyle(color: kTextColor),
   );
 }

     AppBarTheme appBarTheme() {
        return const AppBarTheme(
        color: Colors.white,
        elevation: 0,
    
        iconTheme: IconThemeData(color: Colors.black),
       
         
      );
}