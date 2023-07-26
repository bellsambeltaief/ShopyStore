// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../../helper/invoker.dart';
import '../../models/cm_cart.dart';

class PaymentScreen extends StatefulWidget {
  static String routeName = "/Payment";

  const PaymentScreen({ Key? key }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}


enum PaymentOption{
  onDelivery,
  online
}

orderProduct(context) async{
  Cart cart = Provider.of<Cart>(context, listen:false);

  for (var item in cart.getList){
    print(item.getId);
    print(item.getQuantity);
    Invoker.post("/api/v1/product/add-product-to-cart/", true,
        {"item": item.getId, "quantity": item.getQuantity}).then((value){
          print(value);
        });

  }
  cart.clear();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int activeIndex = 0;
  PaymentOption option = PaymentOption.onDelivery;
  List<Step> generateList(){
    return [
      Step(title: const Text("payment method"),
          content: StatefulBuilder(builder: (builderContext, setState){
            return Row(
              children: [
                GestureDetector(
                  onTap: ()=> setState(()=>option = PaymentOption.onDelivery),
                  child: Row(
                    children: [
                      Radio<PaymentOption>(groupValue: option, value: PaymentOption.onDelivery, onChanged: (value) {
                          setState((){
                            option = PaymentOption.onDelivery;
                          });
                      }, activeColor: Colors.deepOrange),
                      const Text("On Delivery"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: ()=> setState(()=>option=PaymentOption.online),
                  child: Row(
                    children: [
                      Radio<PaymentOption>(groupValue: option, value: PaymentOption.online, onChanged: (value) {
                          setState((){
                            option = PaymentOption.online;
                          });
                      }, activeColor: Colors.deepOrange,),
                      const Text("E-Dinar"),
                    ],
                  ),
                )
              ],
            );
          },),
          isActive: (activeIndex >= 0),
          state: (activeIndex == 0)?StepState.editing: StepState.complete),
      Step(title: const Text("payment credentials"),
          content: (option == PaymentOption.onDelivery)?const OnDeliveryForm(): const OnlineForm(),
          isActive: (activeIndex >= 1),
          state: (activeIndex == 1)?StepState.editing: StepState.indexed)
    ];
  }
  @override
  Widget build(BuildContext context) {
    List<Step> steps = generateList();
    return Scaffold(
      appBar: buildAppBar(context),
      body: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.deepOrangeAccent)
        ),
        child: Stepper(
        steps: steps , onStepContinue: (){
        setState(() {
          if(activeIndex < steps.length - 1) {
            activeIndex += 1;
          }else{
           orderProduct(context).then((b){
             Invoker.post("/api/v1/product/create-order/", true, json.encode({})).then((a){
               Navigator.of(context).pop();
               final snackBar = SnackBar(
                 content: const Text('The order has been affected!'),
                 action: SnackBarAction(

                   label: 'Undo',
                   textColor: Colors.deepOrangeAccent,
                   onPressed: () {
                     // Some code to undo the change.
                   },
                 ),
               );

               // Find the ScaffoldMessenger in the widget tree
               // and use it to show a SnackBar.
               ScaffoldMessenger.of(context).showSnackBar(snackBar);

             });

           });
          }
        });
    }, onStepCancel: (){
      if(activeIndex > 0) {
        setState(() {
          activeIndex -= 1;
        });
      }else{
        Navigator.of(context).pop();
      }
    }, currentStep: activeIndex,

          controlsBuilder: (BuildContext context, ControlsDetails details){
            if(activeIndex == 0){
              return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: <Widget>[
                        ElevatedButton(
                        onPressed: details.onStepContinue,
                          child: const Text('NEXT'),
                        ),
                          TextButton(
                          onPressed: details.onStepCancel,
                          child: const Text('CANCEL'),
                          ),]
                        ),
              );
            }else{
              return Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                ElevatedButton(
            onPressed: details.onStepContinue,
            child: const Text('CHECKOUT'),
            ),
            TextButton(
            onPressed: details.onStepCancel,
            child: const Text('CANCEL'),
            ),
    ]),
              );
            }
          },
        )),
    );
  }
}
AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [Text(" \t \t \t \t \t \t Payment",
         style: TextStyle(color: Colors.black),
        ),
       
        ],
      ),
    );
  }


class OnDeliveryForm extends StatefulWidget {
  const OnDeliveryForm({Key? key}) : super(key: key);

  @override
  _OnDeliveryFormState createState() => _OnDeliveryFormState();
}

class _OnDeliveryFormState extends State<OnDeliveryForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: const [
          Expanded(flex: 1,child: Text("Full Name:")),
          Expanded(flex: 3,child: TextField())
        ],),
        Row(children: const [
          Expanded(flex: 1,child: Text("Address:")),
          Expanded(flex: 3,child: TextField())
        ],),
        Row(children: const [
          Expanded(flex: 1,child: Text("Phone:")),
          Expanded(flex: 3,child: TextField())
        ],),
      ],
    );
  }
}

class OnlineForm extends StatelessWidget {
  const OnlineForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: const [
          Expanded(flex: 2,child: Text("Cart Number:")),
          Expanded(flex: 3,child: TextField())
        ],),
        Row(children: const [
          Expanded(flex: 2,child: Text("Online code:")),
          Expanded(flex: 3,child: TextField())
        ],),
        Row(children: const [
          Expanded(flex: 1,child: Text("Full Name:")),
          Expanded(flex: 3,child: TextField())
        ],),
        Row(children: const [
          Expanded(flex: 1,child: Text("Address:")),
          Expanded(flex: 3,child: TextField())
        ],),
        Row(children: const [
          Expanded(flex: 1,child: Text("Phone:")),
          Expanded(flex: 3,child: TextField())
        ],),
      ],
    );
  }
}


