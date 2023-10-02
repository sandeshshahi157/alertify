import 'package:alertify/views/profiePage.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:alertify/views/Homepage.dart';

import 'package:alertify/views/gradereport.dart';

import 'package:alertify/views/setNotification.dart';
import 'package:flutter/cupertino.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

TextEditingController semester = TextEditingController();
TextEditingController examType = TextEditingController();
TextEditingController cgpa = TextEditingController();
bool _switchValue = true;
bool _switchvalue = false;

class _ResetPasswordState extends State<ResetPassword> {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Update Password"),
          content: Text("Your Passowrd Chnaged successfully."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  bool isadd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 60),
                  child: Text(
                    "Reset Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 47),
                  child: IconButton(
                    icon: Icon( Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                       
                      
                      });

                      Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage(),));
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      left: 250,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(146, 174, 187, 198),
                      radius: 80,
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 320, top: 50),
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 40,
                      ),
                      onPressed: () {
                        setState(() {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage(),));
                          isadd = true;
                        });
                      },
                    )),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: 'Old Password',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: 'New Password',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: 'Confirm Password',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromARGB(255, 45, 113, 169)),
                      height: 40,
                      width: 200,
                      child: MaterialButton(
                        child: Text(
                          "Update Password",
                          style: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                         _showDialog(context);
                        },
                      ),
                    ),
                  ),
                ]),
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.08,
        child: Row(children: [
          SizedBox(
            width: 30,
          ),
          IconButton(
            icon: Icon(
              Icons.calendar_month_outlined,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetNotification(),
                  ));
            },
          ),
          SizedBox(
            width: 100,
          ),
          IconButton(
            icon: Icon(
              Icons.home_outlined,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
          ),
          SizedBox(
            width: 100,
          ),
          IconButton(
            icon: Icon(
              Icons.crisis_alert_outlined,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GradeReport()));
            },
          )
        ]),
      ),
    );
  }
}
