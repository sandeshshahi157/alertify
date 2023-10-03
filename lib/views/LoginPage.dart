// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:alertify/views/Homepage.dart';
import 'package:alertify/views/Signuppage.dart';
import 'package:alertify/views/detailform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoggedIn = false;

  Future<void> login() async {
  // Simulate a login process
  await Future.delayed(Duration(seconds: 2));
  isLoggedIn = true;
}

 FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
              height: MediaQuery.sizeOf(context).height * 0.42,
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(200),
                            bottomRight: Radius.circular(200)),
                        gradient:
                            LinearGradient(begin: Alignment.topRight, colors: [
                          Color.fromARGB(9, 138, 138, 138),
                          Color.fromARGB(255, 109, 139, 205),
                        ])),
                    height: MediaQuery.sizeOf(context).height * 0.24,
                    width: MediaQuery.sizeOf(context).width,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 160, left: 150),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/icon.png"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 320, top: 290),
                    child: Container(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 151, 210, 255),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              topLeft: Radius.circular(50))),
                      child: Row(children: [
                        SizedBox(width: 20,),
                          CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: Icon(
                                    CupertinoIcons.arrow_left,
                                    size: 20,
                                  ),
                              ),
                       

                      ],)
                    ),
                  )
,
                   Padding(
                    padding: const EdgeInsets.only(right: 200, top: 290),
                    child: Container(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width * 0.49,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 151, 210, 255),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Row(children: [
                         SizedBox(width: 20,),
                             Text("LOGIN" ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        SizedBox(width: 20,),
                        
                          CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: Icon(
                                    CupertinoIcons.arrow_left,
                                    size: 20,
                                  ),
                              ),
                         

                      ],)
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                 key: globalKey,

                child: Column(children: [
                  TextFormField(
                      validator: (value){
                  if(value==null || value.isEmpty)
                  {
                    return "This field is required";
                  }
                  else{
                    return null;
                  }
                },
                controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'Email',
                        label: Text("UserEmail"),
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                     validator: (value){
                  if(value==null || value.isEmpty)
                  {
                    return "This field is required";
                  }
                  else if(value.length<=6)
                  {
                    return "Too short password";
                  }
                  else{
                    return null;
                  }
                },
                controller: passwordController,
                    
                    obscureText: true,
                    obscuringCharacter: "X",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'PASSWORD',
                        label: Text("Password"),
                        prefixIcon: Icon(
                          Icons.key,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromARGB(255, 45, 113, 169)),
                      height: 40,
                      width: 150,
                      child: MaterialButton(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {

                           if(globalKey.currentState!.validate())
                  {
                    auth.signInWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString(),
                    ).then((value){
                      
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage(),));
                    },).onError((error, stackTrace){
                      SnackBar(content: Text("Login Failed"),);
                    },);
                  }
                         
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: GestureDetector(
                        onTap: () => (),
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 363.480712890625,
                    height: 0.5,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 109, 109, 109)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 363.480712890625,
                    height: 30,
                    child: Row(children: [
                      SizedBox(
                        width: 12,
                      ),
                      Text("Don't Have an Account ? "),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ]),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 250),
        child: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 184, 223, 255),
          radius: 60,
        ),
      ),
    );
  }
}
