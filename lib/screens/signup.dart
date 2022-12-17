import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:heavytransportship/data/dio-helper.dart';
import 'BaseLayout.dart';
import 'signin.dart';

class signup extends StatefulWidget

{
  @override
  State<StatefulWidget> createState() => InitState();
}
class InitState extends State<signup>
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return initwidget();
  }
  Widget initwidget() {
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
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 8,
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left:20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  validator: (content) {
                    if (content!.isEmpty)
                      return 'Full Name cannot be empty';
                  } ,
                  controller: nameController,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xff2e384d),
                    ),
                    hintText: "Full Name",
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left:20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: emailController,
                  validator: (content) {
                    if (content!.isEmpty)
                      return 'Email cannot be empty';
                  } ,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color(0xff2e384d),
                    ),
                    hintText: "Email",
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left:20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: passwordController,
                  validator: (content) {
                    if (content!.isEmpty)
                      return 'Password cannot be empty';
                  } ,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color(0xff2e384d),
                    ),
                    hintText: "Password",
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: EdgeInsets.only(left:20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: phoneController,
                  validator: (content) {
                    if (content!.isEmpty)
                      return 'Phone cannot be empty';
                  } ,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone,
                      color: Color(0xff2e384d),
                    ),
                    hintText: "Phone Number",
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: ()
                {
                  if(formKey.currentState!.validate()) {
                    DioHelper.postData(
                        path: 'api/register',
                        data:
                        {
                          'first_name':'${nameController.text}' ,
                          'email':'${emailController.text}' ,
                          'phone':'${phoneController.text}' ,
                          'password':'${passwordController.text}' ,
                        }).then((value)
                    {
                      if(DioHelper.n == true) {
                        Fluttertoast.showToast(
                            msg: '${DioHelper.s}',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => BaseLayout()));
                      }
                      else
                      {
                        Fluttertoast.showToast(
                            msg: 'The email has already been taken.',
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
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [(new  Color(0xff2e384d)), new Color(0xff2e384d)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight
                    ),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff2e384d)
                      ),
                    ],
                  ),
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
              ),




              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ?"),
                    GestureDetector(
                        child:TextButton(
                          child: const Text(
                              'Sign in',
                              style: TextStyle(fontSize: 16,
                                  color: Color(0xff2e384d))
                          ),
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>signin()));
                            //signup screen
                          },
                        )
                    )],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}