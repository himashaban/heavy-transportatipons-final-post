import "package:flutter/material.dart";
import 'package:heavytransportship/data/shared-preference.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heavytransportship/cubit/order_cubit.dart';

import 'package:heavytransportship/data/dio-helper.dart';
import 'package:heavytransportship/data/shared-preference.dart';
import 'package:heavytransportship/screens/BaseLayout.dart';

import 'package:heavytransportship/screens/signin.dart';


void main()async {

//main
//  await CashHelper.init();
//  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await  CashHelper.init() ;
  await DioHelper.init() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'ibrahim shaban';

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers:
      [
        BlocProvider<OrderCubit>(create: (context)=>OrderCubit()) ,

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        home: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: signin(),
      //body: CashHelper.getData(key: 'token') ==null ? signin() : BaseLayout() ,
    );
  }

}