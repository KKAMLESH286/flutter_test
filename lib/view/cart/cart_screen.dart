
import 'package:flutter/material.dart';
import 'package:fluttertest/constants.dart';
import 'package:fluttertest/view/cart/cart_controller.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({ Key key }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(child: Column(children: [
            Table(
                          border: TableBorder.all(width: 1.0, color: Colors.black),
                          children: [
                            TableRow(children: [
                              Center(child: Text('Date', textScaleFactor: 1)),
                              Center(child: Text('Time', textScaleFactor: 1)),
                              Center(child: Text('Status', textScaleFactor: 1)),
                            ]),
                          ],
                        ),
                        Obx(()=>
                           Table(
                            border:
                                TableBorder.all(width: 1.0, color: Colors.black),
                            children:
                                List<TableRow>.generate(cartController.subClass.length ?? 0, (index) {
                              final data = cartController.subClass[index];
                              return TableRow(children: [
                                Center(child: Text(data['date'].toString(), textScaleFactor: 1)),
                                Center(child: Text(data['Time'].toString(), textScaleFactor: 1)),
                                // Center(child: Text(data['Seats'].toString(), textScaleFactor: 1)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextButton(onPressed: (){
                                    cartController.deleteClass(data);
                                    }, child: Text("Cancel",style: TextStyle(color: Colors.white),
                                      textScaleFactor: 1),style: ButtonStyle(backgroundColor:data['isAvailable']? MaterialStateProperty.resolveWith(getNullColor):MaterialStateProperty.resolveWith(getNullColor),),),
                                )
                              ]);
                            })),
                        ),
          ],)),
        ),
      ),
      
    );
  }
}