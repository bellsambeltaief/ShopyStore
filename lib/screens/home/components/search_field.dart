import 'package:flutter/material.dart';
import 'package:shopy/screens/Search/search_screen.dart';

import '../../../constants.dart';
import '../../../helper/invoker.dart';
import '../../../size_config.dart';



class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: SizeConfig.screenWidth * 0.7,
      height: 50,
     decoration: BoxDecoration(
       color: kSecondaryColor.withOpacity(0.1),
       borderRadius: BorderRadius.circular(15),
     ),
     child: TextField(
       onChanged: (value){
         //search value
       },
       onSubmitted: (value){
         Invoker.get('/api/v1/product/view-product/', false, query: {
           'search': value
         }).then((value){
           Navigator.of(context).push(MaterialPageRoute(builder: (context){
             return SearchScreen(value);
           }));
         });
       },
       decoration: InputDecoration(
         enabledBorder: InputBorder.none,
         focusedBorder: InputBorder.none,
         hintText: "Search Product",
         prefixIcon: const Icon(Icons.search),
         contentPadding: EdgeInsets.symmetric(
           horizontal: getProportionateScreenWidth(20),
           vertical: getProportionateScreenWidth(9),

           ),

           ),

       ),
     );
  }
}
