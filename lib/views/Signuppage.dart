// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously
import 'package:alertify/views/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
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
                    padding: const EdgeInsets.only(left: 200, top: 290),
                    child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        width: MediaQuery.sizeOf(context).width * 0.49,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 151, 210, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                topLeft: Radius.circular(50))),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.08,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  CupertinoIcons.arrow_left,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ));
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.08,
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
                              width: MediaQuery.sizeOf(context).width * 0.08,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  CupertinoIcons.arrow_left,
                                  size: 20,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ));
                                },
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
                key: globalKey,
                child: Column(children: [
                  TextFormField(
                    controller: nameController,
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
                    height: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
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
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else if (value.length <= 6) {
                        return "Too short password";
                      } else {
                        return null;
                      }
                    },
                    controller: passwordController,
                    obscureText: true,
                    obscuringCharacter: "*",
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
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromARGB(255, 45, 113, 169)),
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      child: MaterialButton(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          if (globalKey.currentState!.validate()) {
                            try {
                              final UserCredential userCredential =
                                  await auth.createUserWithEmailAndPassword(
                                      email: emailController.text.toString(),
                                      password:
                                          passwordController.text.toString());

                              await userCredential.user!
                                  .sendEmailVerification();
                              CollectionReference collRef =
                                  FirebaseFirestore.instance.collection('User');
                              collRef.add({
                                'Name': nameController.text.toString(),
                                'Email': emailController.text.toString(),
                                'Password': passwordController.text.toString()
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 40, 109, 139),
                                duration: Duration(milliseconds: 800),
                                content: Center(
                                  child: Text(
                                    "User Created. Check your email for verification.",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ));

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            } catch (error) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 70, 115, 161),
                                duration: Duration(milliseconds: 400),
                                content: Center(
                                  child: Text(
                                    "Sign Up Failed: ${error.toString()}",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ));
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 0.5,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 109, 109, 109)),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.02,
                    child: Row(children: [
                      SizedBox(width: MediaQuery.sizeOf(context).width * 0.012),
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
