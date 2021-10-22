import 'package:flutter/material.dart';
import 'dart:async';

import 'package:fluttertest/constants.dart';
import 'package:fluttertest/data.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  Timer _timer;
  int _start = 60;
  List _data = Data().classScheduleData;

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
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Test"),
      ),
      body: SingleChildScrollView(
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
                        TextSpan(text: "7", style: kHeadingStyle)
                      ]))
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
                          Text('Date', textScaleFactor: 1),
                          Text('Time', textScaleFactor: 1),
                          Text('Availability', textScaleFactor: 1),
                          Text('Status', textScaleFactor: 1),
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
                            Text(data['date'].toString(), textScaleFactor: 1),
                            Text(data['Time'].toString(), textScaleFactor: 1),
                            Text(data['Seats'].toString(), textScaleFactor: 1),
                            Text(data['isAvailable'].toString(),
                                textScaleFactor: 1),
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

  TableRow newTableRow(
      {String date, String time, String availability, String status}) {
    return TableRow(children: [
      Text(date, textScaleFactor: 1),
      Text(time, textScaleFactor: 1),
      Text(availability.toString(), textScaleFactor: 1),
      Text(status, textScaleFactor: 1),
    ]);
  }

  TableRow mappedRow() {
    List<dynamic> _data = Data().classScheduleData;
    _data.map((e) {
      if (e != null) {
        newTableRow(
            date: e.toString(),
            time: e.toString(),
            availability: e.toString(),
            status: e.toString());
      }
    }).toList();
  }
}

// List<dynamic> _data = Data().classScheduleData;

// _data.map((dropDownStringItem) {
//                               return newTableRow(date: _data[0].date)
// DropdownMenuItem<String>(
//   value: dropDownStringItem.id.toString(),
//   child: Text(
//     dropDownStringItem?.categoryName
//                 .toString()
//                 .length <
//             12
//         ? dropDownStringItem?.categoryName
//                 ?.toString() ??
//             " "
//         : "${dropDownStringItem?.categoryName.toString().substring(0, 12)}.." ??
//             " "
//     // dropDownStringItem.categoryName.toString()
//     ,
//     style: kYearTextStyle,
//   ),
//   onTap: () {
//     subCategory != null
//         ? subCategory = null
//         : subCategory = subCategory;
//   },
// );
// }).toList(),

TableRow newTableRow(
    {String date, String time, int availability, String status}) {
  return TableRow(children: [
    Text(date, textScaleFactor: 1),
    Text(time, textScaleFactor: 1),
    Text(availability.toString(), textScaleFactor: 1),
    Text(status, textScaleFactor: 1),
  ]);
}
