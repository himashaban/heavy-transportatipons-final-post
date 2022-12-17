import 'dart:ui';
import 'package:heavytransportship/screens/truckorder.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heavytransportship/screens/order.dart';
import 'order.dart';
import 'package:flutter/src/widgets/navigator.dart';


class BaseLayout extends StatefulWidget{
  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xfffafafa),
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.exit_to_app,color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);},),
          actions: [
       IconButton(icon: Icon(Icons.history,color: Colors.black), onPressed: () {

    }),]
      ),








    body:


      SingleChildScrollView(



        child:Center(

            child:Column(
             mainAxisSize: MainAxisSize.min,
            children:[
            Text(
                "Choose the shipping method",
                style: const TextStyle(
                    color:  const Color(0xff2e384d),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    fontStyle:  FontStyle.normal,
                    fontSize: 24.0
                ),
                textAlign: TextAlign.left
            ),
              SizedBox(height:6),
            InkWell(
              child: Container(
                width: 350,
                height: 279,
               decoration: BoxDecoration(
                   boxShadow: [BoxShadow(
                       color: const Color(0x29000000),
                       offset: Offset(0,5),
                       blurRadius: 15,
                       spreadRadius: 0
                   )] ,
                 color: const Color(0xffffffff)),

                   child:Column(
                children:[

                    Container(child: Image.asset('images/truck.jpg'),
                  width: 326,
                  height: 212
              ),
                    SizedBox(height:6),
                    Text(
                     "Trucks",
                     style: const TextStyle(
                         color:  const Color(0xff000000),
                         fontWeight: FontWeight.w700,
                         fontFamily: "SegoeUI",
                         fontStyle:  FontStyle.normal,
                         fontSize: 20.0
                     ),
                     textAlign: TextAlign.left
                 )



               ],),

        ),

              onTap: (){
               Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>truckorder()),
               );
              },
            ),
            SizedBox(height: 30,),
            InkWell(
              child: Container(
                width: 350,
                height: 279,
                child:Material(
                  elevation:8 ,

                  clipBehavior: Clip.antiAlias,
                  child:Column(
                    children:[

                      Container(child: Image.asset('images/winches.jpg'),
                          width: 326,
                          height: 212
                      ),
                      SizedBox(height: 6),
                      Text(
                          "Winches",
                          style: const TextStyle(
                              color:  const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "SegoeUI",
                              fontStyle:  FontStyle.normal,
                              fontSize: 20.0
                          ),
                          textAlign: TextAlign.left
                      )



                    ],),

                ),
              ),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>order()),
                );
              },
            ),
                ],),


        ),

        ),
      );










  }
}