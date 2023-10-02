// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:alertify/views/Homepage.dart';

import 'package:alertify/views/setNotification.dart';

import 'package:flutter/material.dart';

class GradeReport extends StatefulWidget {
  const GradeReport({super.key});

  @override
  State<GradeReport> createState() => _GradeReportState();
}

TextEditingController semester = TextEditingController();
TextEditingController examType = TextEditingController();
TextEditingController cgpa = TextEditingController();

class _GradeReportState extends State<GradeReport> {
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
                height: MediaQuery.sizeOf(context).height * 0.2,
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 60),
                    child: const Text(
                      "Grade Report",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 47),
                    child: IconButton(
                      icon: Icon(isadd ? Icons.arrow_back : Icons.grade,size: 30,),
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
                          Icons.add,
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
                ]),
              ),
              IndexedStack(index: _currentindex, children: [
                Visibility(
                  child: Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.72,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: Color.fromARGB(255, 91, 172, 178)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 280,
                                  ),
                                  child: Text("Degree: "),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, left: 14),
                                  child: Text(
                                    "BACHELOR OF TECHNOLOGY IN COMPUTER ENGINEERING",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 270, top: 3),
                                  child: Text("Semester:"),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 244, top: 3),
                                  child: Text("SEMESTER 5",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 210, top: 3),
                                  child: Text("Student Exam Type "),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 265, top: 3),
                                  child: Text("REGULAR",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 290, top: 3),
                                  child: Text("CGPA "),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 300, top: 3),
                                  child: Text("8.44",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 260, top: 3),
                                  child: Text("Percentage"),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 290, top: 3),
                                  child: Text("80.11",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Visibility(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 240),
                            child: Text(
                              "Semester:  ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            controller: semester,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 230),
                            child: Text(
                              "Exam Type:  ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            controller: examType,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 270),
                            child: Text(
                              "CGPA:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            controller: cgpa,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Color.fromARGB(255, 170, 217, 255),
                                  ),
                                  height: 30,
                                  width: 80,
                                  child: MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentindex = 0;
                                        isadd = false;
                                      });
                                    },
                                    child: Text("Submit"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: Color.fromARGB(255, 172, 217, 255),
                                  ),
                                  height: 30,
                                  width: 80,
                                  child: MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentindex = 0;  isadd =false;
                                      });
                                    },
                                    child: Text("Calcel"),
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                  ),
                )
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
