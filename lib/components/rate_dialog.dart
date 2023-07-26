// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../helper/invoker.dart';

rateDialog(BuildContext context, int id, {void Function(void Function())? onPress, void Function()? args}) async{
  List<Color> color = [
    Colors.deepOrangeAccent,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  int rate = 1;

   showDialog(
      barrierDismissible: false,
      context: context,
      builder: (builder){
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Please Rate our product'),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: color.mapIndexed((i, e) => GestureDetector(
                          child: Icon(Icons.star, color: e, size: 45,),
                          onTap: (){
                            setState((){
                              for(int j = 0; j<color.length; j++){
                                if(j<=i){
                                  color[j] = Colors.deepOrangeAccent;
                                  rate = j + 1 ;

                                }else{
                                  color[j] = Colors.black;
                                }

                              }
                            });
                          },
                        )).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(onPressed: (){
                            print(rate);
                             Invoker.post('/api/v1/product/create-product-rating/', 
                            true, 
                            {

                                  "product_id": id,
                                  "rating": rate

                              }).then((value){
                                print(value);
                                Navigator.of(context).pop();
                                onPress!(args!);
                              });
                          }, child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Submit"),
                          ), style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(onPressed: (){
                              Navigator.of(context).pop();}, child: const Text("Do"),
                           ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        );
      });
}