import 'dart:async';
import 'package:flutter/material.dart';
import 'package:heavytransportship/screens/payment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavytransportship/cubit/order_cubit.dart';
import 'package:heavytransportship/cubit/order_state.dart';
import 'package:heavytransportship/data/shared-preference.dart';
import 'package:heavytransportship/data/dio-helper.dart';








class order extends StatefulWidget {
  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  DateTime date = DateTime(2022, 1, 1);
  String sizevalue = 'Winch';

  String title = 'Time Picker';
  TimeOfDay _time = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _time = TimeOfDay.now();
  }

  String tovalue = 'Giza';

  // List of items in our dropdown menu
  var to = [
    'Cairo',
    'Giza',
    'Sharm El Sheikh',
    'Suez',
    'Aswan',
    'Alexandria',
    'Hurgada',
    'Luxor'
  ];
  String fromvalue = 'Cairo';

  // List of items in our dropdown menu
  var from = [
    'Cairo',
    'Giza',
    'Sharm El Sheikh',
    'Suez',
    'Aswan',
    'Alexandria',
    'Hurgada',
    'Luxor'
  ];
  int Hoursvalue = 1;

  // List of items in our dropdown menu
  List<int> Hours =
  [
    01,
    02,
    03,
    04,
    05,
    06,
    07,
    08,
    09,
    10,
    11,
    12,
  ];

  String AMPMvalue = "AM";
  var AMPM = [
    'AM',
    'PM',
  ];

  int minutesvalue = 00;

  // List of items in our dropdown menu
  List<int> minutes = [
    00,
    01,
    02,
    03,
    04,
    05,
    06,
    07,
    08,
    09,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59
  ];
  int price = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xfffafafa),
          appBar: AppBar(
              backgroundColor: Color(0xfffafafa),
              bottomOpacity: 0.0,
              elevation: 0.0,
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: // Ex.Fex
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xffff6e00),
                            fontWeight: FontWeight.w300,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontSize: 32.0),
                        text: "                    Ex."),
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xffff6e00),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontSize: 32.0),
                        text: ".F"),
                    TextSpan(
                        style: const TextStyle(
                            color: const Color(0xffff6e00),
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontSize: 32.0),
                        text: "ex")
                  ]))),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "    Idel Cars",
                        style: const TextStyle(
                          color: const Color(0xff2e384d),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.normal,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 357.962890625,
                    height: 52.6416015625,
                    decoration: new BoxDecoration(
                        color: Color(0x33e0e7ff),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Text("From:   "),
                        DropdownButton(
                          value: tovalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: to.map((String to) {
                            return DropdownMenuItem(
                              value: to,
                              child: Text(to),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              tovalue = newValue!;
                              OrderCubit.get(context).getPriceInOrder(
                                tovalue: tovalue,
                                fromvalue: fromvalue,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  ClipOval(
                    child: Icon(
                      Icons.import_export_sharp,
                      size: 50,
                    ),
                  ),

                  Container(
                    width: 357.962890625,
                    height: 52.6416015625,
                    decoration: new BoxDecoration(
                        color: Color(0x33e0e7ff),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Text("To:   "),
                        DropdownButton(
                          value: fromvalue,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items: from.map((String from) {
                            return DropdownMenuItem(
                              value: from,
                              child: Text(from),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              fromvalue = newValue!;
                              OrderCubit.get(context).getPriceInOrder(
                                tovalue: tovalue,
                                fromvalue: fromvalue,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
///////////////Timepickerrrrrrrrr
                  Container(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0x33e0e7ff),
                            padding: EdgeInsets.symmetric(
                                horizontal: 140, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2026));
                          if (newDate == null) return;
                          setState(() => date = newDate);
                        },
                        child: Text('${date.day}/${date.month}/${date.year}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xff000000),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: 357.962890625,
                    height: 52.6416015625,
                    decoration: new BoxDecoration(
                        color: Color(0x33e0e7ff),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Text("Hours:   "),
                        DropdownButton(
                          value: Hoursvalue,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items: Hours.map((int Hours) {
                            return DropdownMenuItem(
                              value: Hours,
                              child: Text('${Hours}'),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              Hoursvalue = newValue!;
                            });
                          },
                        ),
                        Text("minutes:   "),
                        DropdownButton(
                          value: minutesvalue,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items: minutes.map((int minutes) {
                            return DropdownMenuItem(
                              value: minutes,
                              child: Text('${minutes}'),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              minutesvalue = newValue!;
                            });
                          },
                        ),
                        Text("     "),
                        DropdownButton(
                          value: AMPMvalue,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                          ),
                          items: AMPM.map((String AMPM) {
                            return DropdownMenuItem(
                              value: AMPM,
                              child: Text('${AMPM}'),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              AMPMvalue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    width: 357.962890625,
                    height: 52.6416015625,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: const Color(0x33e0e7ff)),
                    child: Text(('Total price'
                        '               ${OrderCubit.get(context).priceOrder}')),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    width: 353.119140625,
                    height: 49.0263671875,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xff0a0f1d) // Background color
                        ),
                        onPressed: () {
                          DioHelper.PostDataInOrder(
                              path: 'api/reservations',
                              data: {
                                'user_id': '${CashHelper.getData(key: 'id')}',
                                'from': '$fromvalue',
                                'to': '$tovalue',
                                'trucktype': '$sizevalue',
                                'hour': '$Hoursvalue',
                                'minute': '$minutesvalue',
                                'Ampm': '$AMPMvalue',
                                'date': ' $date',
                              }).then((value) {
                            Fluttertoast.showToast(
                                msg: 'Order Is Success',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);

                            CashHelper.saveData(
                                key: 'trucktype', value: sizevalue);
                            CashHelper.saveData(
                                key: 'Hoursvalue', value: Hoursvalue);
                            CashHelper.saveData(
                                key: 'minutesvalue', value: minutesvalue);
                            CashHelper.saveData(
                                key: 'AMPMvalue', value: AMPMvalue);

                            print(
                                'id is  equal : ${CashHelper.getData(key: 'id')}');
                            print('From is equal : $fromvalue');
                            print('To is equal : $tovalue');
                            print('Date is equal : $date');
                            print('Hours is equal :  $Hoursvalue');
                            print('Minutis is equal : $minutesvalue');
                            print('AMPM is equal : $AMPMvalue');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => payment()));
                          });
                        },
                        child: Text(
                          "Confirm Order",
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Roboto",
                              fontSize: 13.0),
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

