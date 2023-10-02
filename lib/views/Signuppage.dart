// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:alertify/views/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    padding: const EdgeInsets.only(left: 200, top: 290),
                    child: Container(
                        height: 40,
                        width: MediaQuery.sizeOf(context).width * 0.49,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 151, 210, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                topLeft: Radius.circular(50))),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                CupertinoIcons.arrow_left,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 200, top: 290),
                    child: Container(
                        height: 40,
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 151, 210, 255),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                CupertinoIcons.arrow_left,
                                size: 20,
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'USERNAME',
                        label: Text("UserName"),
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: "X",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'PASSWORD',
                        label: Text("Password"),
                        prefixIcon: Icon(
                          Icons.key_outlined,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'E-MAIL',
                        label: Text("Email"),
                        prefixIcon: Icon(
                          Icons.email_outlined,
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
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => (),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 363.480712890625,
                    height: 0.5,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 109, 109, 109)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 363.480712890625,
                    height: 30,
                    child: Row(children: [
                      SizedBox(
                        width: 12,
                      ),
                      Text("Already Have an Account ? "),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                          },
                          child: Text(
                            "Login",
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
          backgroundColor: Color.fromARGB(145, 184, 223, 255),
          radius: 60,
        ),
      ),
    );
  }
}
