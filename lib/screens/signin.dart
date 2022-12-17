import 'package:flutter/material.dart';
import 'package:heavytransportship/data/dio-helper.dart';
import 'package:heavytransportship/screens/BaseLayout.dart';

import 'package:heavytransportship/screens/signup.dart';
import 'package:fluttertoast/fluttertoast.dart';



void main() => runApp(const signin());





class signin extends StatefulWidget {
  const  signin ({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<signin> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
      Form(
        key:formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 80,),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                        "Sign In ",
                        style: const TextStyle(
                            color: const Color(0xff2e384d),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontSize: 31.0
                        ),
                        textAlign: TextAlign.left
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),

              Container(
                width: 352.9423828125,
                height: 49.0263671875,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)
                    ),
                    border: Border.all(
                        color: const Color(0xffe0e7ff),
                        width: 1
                    ),
                    color: const Color(0x33e0e7ff)
                ),

                child: TextFormField(
                  validator: (content){
                    if(content!.isEmpty) {
                      return 'Email cannot be empty' ;
                    }
                  },
                  controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0x33e0e7ff),
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 352.9423828125,
                height: 49.0263671875,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(5)
                    ),
                    border: Border.all(
                        color: const Color(0xffe0e7ff),
                        width: 1
                    ),
                    color: const Color(0x33e0e7ff)
                ),
                child: TextFormField(
                validator:(context){
                 if(context!.isEmpty){
                   return 'password cannot be Empty ';
                 }
               },
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      filled: true,
                      fillColor: Color(0x33e0e7ff)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                      primary: Color(0xff2e384d)),
                    child: const Text('Login'),
                    onPressed: () {
                    if(formKey.currentState!.validate()){
                      DioHelper.postData(path: 'api/login', data:{
                      'email':'${emailController.text}',
                      'password':'${passwordController.text}'
                      }
                      ).then((value) {
                        if (DioHelper.n == true) {
                          Fluttertoast.showToast(
                              msg: '${DioHelper.s}',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          Navigator.push(context,MaterialPageRoute(builder: (context) => BaseLayout()));
                        }
                        else{
                          Fluttertoast.showToast(
                              msg: '${DioHelper.s}',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      }).catchError((error)
                      {
                        print('error in to sigin') ;
                        print(error.toString()) ;
                      });

                    }

                    },
                  )
              ),
              Row(
                children: <Widget>[
                  Text("Don't have an account?"),
                  TextButton(
                    child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 16,
                            color: Color(0xff2e384d))
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => signup()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
      ));
  }

  // CREAT

}