
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AttedencePage extends StatefulWidget {
  const AttedencePage({super.key});

  @override
  State<AttedencePage> createState() => _AttedencePageState();
}

class _AttedencePageState extends State<AttedencePage> {
    bool isChecked =true;
    bool isnotChecked =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => (),
          )
        ],
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'Flutter Report',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Color.fromARGB(73, 194, 232, 255),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Container(
              child: Row(children: [
                SizedBox(
                  width: 60,
                ),
                Text(
                  "Class",
                  style: TextStyle(fontSize: 18),
                ),
                  SizedBox(
                  width: 180,
                ),
                 Text(
                  "Status",
                  style: TextStyle(fontSize: 18),
                ),
              ]),
              color: Colors.amber,
              height: 50,
              width: MediaQuery.sizeOf(context).width,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.8,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                  
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        child:Row(children: [
                SizedBox(
                  width: 10,
                ),
                Container(
               
                  width: 200,
                  child: Text(
                    "Lecture $index",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                  SizedBox(
                  width: 30,
                ),
                Container(child: Row(children: [

                  Text("P"),
                  Checkbox(
              value: isChecked,
              onChanged: (bool? index) {
               
                setState(() {
                  isChecked = index!;
                });
              },
            ),
                   
                  Checkbox(
              value: isnotChecked,
              onChanged: (bool? index) {
               
                setState(() {
                  isnotChecked = index!;
                  
                });
              },
            ),
                Text("A"),
                
                 
                ]),)
              ]),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))),
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),


    );
  }
}
