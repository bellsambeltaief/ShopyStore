import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      { "icon": "assets/icons/Flash.svg", "text": "Flash Deal" },
      { "icon": "assets/icons/Bill.svg", "text": "Bill" },
      { "icon": "assets/icons/Game.svg", "text": "Game" },
      { "icon": "assets/icons/Gift.svg", "text": "Daily Gift" },
    
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            categories.length, 
            (index) => CategoryCard(
              icon: categories[index]["icon"],
               text: categories[index]["text"], 
               press: (){},
               ),
               ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key, 
    required this.icon, 
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      
      },
      child: SizedBox (
        width: getProportionateScreenWidth(55),
        child:  Column(
          children: [
            AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(15)),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
    
                ),
                child: SvgPicture.asset(icon) ,
    
    
            ),
             ),
              const SizedBox(height: 5),
              Text(text,
              textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
