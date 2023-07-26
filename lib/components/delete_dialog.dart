import 'package:flutter/material.dart';

void deleteDialog(BuildContext context, void Function()? onPress) async{
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (builder){
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 18.0),
                        height: 40,
                        child: const Icon(Icons.warning_amber, color: Color(
                            0xFFDE3030),),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEE2E2),
                          borderRadius: BorderRadius.circular(60)
                        ),
                      ),
                    ),
                    const Expanded(flex: 4,child: Text("Are you sure you want to delete this product? All of this product data will be permanently removed. This action cannot be undone. ",))
                  ],
                ),
              ),
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFFF9FAFB)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: onPress, child: const Text("Delete"), style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffdc2626)
                    ),),
                    const SizedBox(width: 10,),
                    TextButton(onPressed: ()=>Navigator.of(context).pop(), child: const Text("Cancel"), style: TextButton.styleFrom(
                      foregroundColor: Colors.deepOrange
                    ),)
                  ],),
              )

            ],
          ),
        );
      });
}