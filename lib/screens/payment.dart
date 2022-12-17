import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavytransportship/data/shared-preference.dart';
import 'package:heavytransportship/data/dio-helper.dart';
import 'package:heavytransportship/screens/BaseLayout.dart';

class payment extends StatefulWidget {
  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  var holderController = TextEditingController();
  var numberController = TextEditingController();
  var cvvController = TextEditingController();
  var exMMpController = TextEditingController();
  var exYYpController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          },
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Payment Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Credit Card",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                height: 180,
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: SweepGradient(
                    center: AlignmentDirectional(1, -1),
                    startAngle: 1.7,
                    endAngle: 3,
                    colors: const <Color>[
                      Color(0xff2e384d),
                      Color(0xff2e384d),
                      Color(0xFF0D47A1),
                      Color(0xFF0D47A1),
                      Color(0xff2e384d),
                      Color(0xff2e384d),
                    ],
                    stops: const <double>[0.0, 0.3, 0.3, 0.7, 0.7, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Visa",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Visa Electron",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "****\t\t****\t\t****\t\t****\t\t 2146",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Card holder",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Olivar",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expries",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "07\t/\t 26",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF0D47A1),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: holderController,
                      validator: (content) {
                        if (content!.isEmpty)
                          return 'Card Holder cannot be empty';
                      },
                      decoration: InputDecoration(
                        labelText: 'Card Holder',
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (content) {
                        if (content!.isEmpty)
                          return 'Card Number cannot be empty';
                      },
                      controller: numberController,
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (content) {
                        if (content!.isEmpty) return 'CVV cannot be empty';
                      },
                      controller: cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (content) {
                        if (content!.isEmpty) return 'EXP-MM cannot be empty';
                      },
                      controller: exMMpController,
                      decoration: InputDecoration(
                        labelText: 'EXP-MM',
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (content) {
                        if (content!.isEmpty) return 'EXP-YY cannot be empty';
                      },
                      controller: exYYpController,
                      decoration: InputDecoration(
                        labelText: 'EXP-YY',
                        border: OutlineInputBorder(),
                      ),
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      color: Color(0xff2e384d),
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            DioHelper.PostDataInPayment(path: '', data: {
                              'hour':
                              '${CashHelper.getData(key: 'Hoursvalue')}',
                              'minute':
                              '${CashHelper.getData(key: 'minutesvalue')}',
                              'Ampm': '${CashHelper.getData(key: 'AMPMvalue')}',
                              'trucktype':
                              '${CashHelper.getData(key: 'trucktype')}',
                              'payment_type': 'CC',
                              'card_number': '$numberController',
                              'card_holder': '$holderController',
                              'exp_mm': '$exMMpController',
                              'exp_yy': '$exYYpController',
                              'cvv': '$cvvController',
                            }).then((value) {
                              Fluttertoast.showToast(
                                  msg: 'Payment Is Success',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BaseLayout()));
                            });
                          }
                        },
                        child: Text(
                          'CONFIRM SHIPMENT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


