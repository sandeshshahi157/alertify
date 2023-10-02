// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:alertify/views/attedence.dart';
import 'package:alertify/views/gradereport.dart';
import 'package:alertify/views/profiePage.dart';
import 'package:alertify/views/setNotification.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _value = 20;
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.45,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 50),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/icon.png"),
                    radius: 40,
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
                        Icons.person,
                        size: 50,
                      ),
                      onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ProfilePage(),));
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 0, top: 140),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(146, 204, 225, 243),
                      radius: 40,
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 120, left: 100, right: 20),
                  child: CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: 0.77,
                    center: Text(
                      "77.0%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: Text(
                      "Average Attedence ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.purple,
                  ),
                )
              ]),
            ),
            IndexedStack(index: _currentindex, children: [
              Visibility(
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.45,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.12,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: Color.fromARGB(255, 141, 206, 255)),
                          child: Row(children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.006,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _currentindex = 1;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                width: MediaQuery.sizeOf(context).width * 0.65,
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            color: Colors.black,
                                            width: 2,
                                            height: 20,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Application Devlopement with Flutter ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 130),
                                    child: Text(
                                      "Attendence 0/10 ",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 180, top: 10),
                                    child: Text(
                                      "Status:  ",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.01,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AttedencePage(),
                                    ));
                              },
                              child: Container(
                                child: Center(
                                  child: CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 6,
                                    percent: 0.90,
                                    center: Text("90%"),
                                    progressColor: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                width: MediaQuery.sizeOf(context).width * 0.29,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 240),
                        child: Text(
                          "Subject Name ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 251),
                        child: Text(
                          "Total Class ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 180),
                        child: Text(
                          "Mandatory Attedance ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      SfSlider(
                        min: 0.0,
                        max: 100.0,
                        value: _value,
                        interval: 20,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            _value = value;
                          });
                        },
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
                                color: Color.fromARGB(255, 141, 184, 219),
                              ),
                              height: 30,
                              width: 80,
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    _currentindex = 0;
                                  });
                                },
                                child: Text("Save"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.3,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Color.fromARGB(255, 141, 184, 219),
                              ),
                              height: 30,
                              width: 80,
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    _currentindex = 0;
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
              )
            ]),
          ],
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
