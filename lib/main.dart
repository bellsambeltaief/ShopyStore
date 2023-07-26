import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shopy/models/cm_product.dart';
import 'package:shopy/routs.dart';
import 'package:shopy/screens/splash/splash_screen.dart';
import 'package:shopy/theme.dart';
import 'models/cm_cart.dart';
import 'models/cm_favorite.dart';
import 'models/cm_user.dart';



void main() {
  runApp(
      // ChangeNotifierProvider<User>(create: (context) => User(), child: MyApp(),)
      MultiProvider(providers: [
        ChangeNotifierProvider<CmUser>(create: (context) => CmUser()),
        ChangeNotifierProvider<Cart>(create: (context)=> Cart()),
        ChangeNotifierProvider.value(value: ProductList.getInstance()),
        ChangeNotifierProvider<Favorite>(create: (context)=>Favorite()),
        ChangeNotifierProvider<VendorProduct>(create: (context)=> VendorProduct())
      ], child: MyApp(),)

  );
}

class MyApp extends StatelessWidget {

  final Client clientService =  Client() ;

  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
      

    );
    
  }
}
