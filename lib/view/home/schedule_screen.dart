import 'package:flutter/material.dart';
import 'package:fluttertest/res/images.dart';
import 'package:fluttertest/view/cart/cart_controller.dart';
import 'package:fluttertest/view/cart/cart_screen.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:fluttertest/constants.dart';
import 'package:fluttertest/data.dart';
import 'dart:math';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  Timer _timer;
  int _start = 60;
  List _data = Data().classScheduleData;
  int randomNumber;
  

  final _random = new Random();
 
  int next(int min, int max) => min + _random.nextInt(max - min);
  

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
     randomNumber = next(5,15);
     setNewNumber();
  }


  void setNewNumber(){
   randomNumber -= 1;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Test"),
        actions: [MaterialButton(
              minWidth: 5,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              child: Obx(
                () => myAppBarIcon(AssetImage(AppImages.cart),
                    controller.subClass.length.toString()),
              )),],
      ),
      body: _start==0 ?AlertDialog(
        title: const Text('Time up!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Your Time is up.'),
              Text('Please go to the cart to check the booked classes.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Go To Cart'),
            onPressed: () {
              Get.to(CartScreen());
            },
          ),
        ],
      
    
  ): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Time Left: $_start seconds", style: kTimerStyle),
              ),
              SizedBox(height: 10),
              Text("Claim your free Trial Class", style: kHeadingStyle),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Class Schedule", style: kTableHeading),
                   RichText(
                        text: TextSpan(
                            text: "Free Seats Left: ",
                            style: kTimerStyle,
                            children: [
                          TextSpan(text: randomNumber<=0? "0":randomNumber.toString(), style: kHeadingStyle)
                        ])),
                  
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(width: 1.0, color: Colors.black),
                      children: [
                        TableRow(children: [
                          Center(child: Text('Date', textScaleFactor: 1)),
                          Center(child: Text('Time', textScaleFactor: 1)),
                          Center(child: Text('Seats', textScaleFactor: 1)),
                          Center(child: Text('Status', textScaleFactor: 1)),
                        ]),
                      ],
                    ),
                    Table(
                        border:
                            TableBorder.all(width: 1.0, color: Colors.black),
                        children:
                            List<TableRow>.generate(_data.length ?? 0, (index) {
                          final data = _data[index];
                          return TableRow(children: [
                            Center(child: Text(data['date'].toString(), textScaleFactor: 1)),
                            Center(child: Text(data['Time'].toString(), textScaleFactor: 1)),
                            Center(child: Text(data['Seats'].toString(), textScaleFactor: 1)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(onPressed:data['isAvailable']? (){
                                if(randomNumber<=0){ Get.snackbar("Alert", "No free seats left",snackPosition: SnackPosition.BOTTOM);} else controller.addClass(data)
                                ;
                                setNewNumber();}:(){}, child: Text(data['isAvailable']?"Book":"Full",style: TextStyle(color: Colors.white),
                                  textScaleFactor: 1),style: ButtonStyle(backgroundColor:data['isAvailable']? MaterialStateProperty.resolveWith(getColor):MaterialStateProperty.resolveWith(getNullColor),),),
                            )
                          ]);
                        })),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget myAppBarIcon(ImageProvider<Object> icon, String count) {
  return Container(
    width: 30,
    height: 30,
    child: Stack(
      children: [
        ImageIcon(
          icon,
          color: Colors.white,
        ),
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(top: 0),
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kSecondaryColor,
                border: Border.all(color: Colors.white, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Center(
                child: Text(
                  count,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}