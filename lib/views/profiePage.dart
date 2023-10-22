// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:alertify/views/Homepage.dart';
import 'package:alertify/views/LoginPage.dart';
import 'package:alertify/views/Signuppage.dart';
import 'package:alertify/views/gradereport.dart';
import 'package:alertify/views/resetpassword.dart';

import 'package:alertify/views/setNotification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

TextEditingController semester = TextEditingController();
TextEditingController examType = TextEditingController();
TextEditingController cgpa = TextEditingController();
bool _switchValue = true;
bool _switchvalue = false;

class _ProfilePageState extends State<ProfilePage> {
  int _currentindex = 0;
  bool isadd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.4,
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80, top: 60),
                    child: Text(
                      isadd ? "Settings" : "Profile",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 47),
                    child: IconButton(
                      icon: Icon(
                          isadd ? Icons.arrow_back : Icons.person_2_outlined),
                      onPressed: () {
                        setState(() {
                          _currentindex = 0;
                          isadd = false;
                        });
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
                            _currentindex = 1;
                            isadd = true;
                          });
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.only(left: 0, top: 140),
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(146, 204, 225, 243),
                        radius: 40,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 150, left: 150),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Color.fromARGB(255, 25, 121, 133),
                      child: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 250, left: 50, right: 50),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      child: Center(
                        child: Text(
                          "User Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              IndexedStack(index: _currentindex, children: [
                Visibility(
                    child: Container(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.51,
                        child: Padding(
                            padding: const EdgeInsets.all(0.50),
                            child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color.fromARGB(255, 235, 235, 235)),
                                child: Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                     child:
                                    StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('User')
                                          .snapshots(), // 'users' is the name of the collection
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return CircularProgressIndicator(); // Display a loading spinner
                                        }
                                        final documents = snapshot.data?.docs; // List of document snapshots

                                        return ListView.builder(
                                          itemCount: documents?.length,
                                          itemBuilder: (context, index) {
                                            final document = documents?[index];
                                            final data = document?.data()
                                                as Map<String, dynamic>;
                                            final username = data['FullName'];
                                            final branch = data['Branch'];

                                            return ListTile(
                                              title:
                                                  Text('Full Name: $username'),
                                              subtitle: Text('Branch: $branch'),
                                            );
                                          },
                                        );
                                      },
                                    )))))),
                Visibility(
                    child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.51,
                  child: Column(children: [
                    ListTile(
                      trailing: CupertinoSwitch(
                        value: _switchvalue,
                        onChanged: (value) {
                          setState(() {
                            _switchvalue = value;
                          });
                        },
                      ),
                      leading: Icon(
                        Icons.dark_mode_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: Text(
                        "Dark Mode",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      trailing: CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                      leading: Icon(
                        Icons.notifications_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: Text(
                        "Notification",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPassword(),
                            ));
                      },
                      leading: Icon(
                        Icons.lock_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: Text(
                        "Reset Password",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      leading: Icon(
                        Icons.group_add_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: Text(
                        "Add Other Account",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 30,
                      ),
                      title: Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    )
                  ]),
                ))
              ]),
            ],
          ),
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
