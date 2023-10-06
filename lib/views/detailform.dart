

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alertify/views/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


 class DetailForm extends StatefulWidget {
  const DetailForm({super.key});

  @override
  State<DetailForm> createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
    FirebaseAuth auth = FirebaseAuth.instance;
      GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
   TextEditingController semester = TextEditingController();
    TextEditingController branch = TextEditingController();
     TextEditingController totalSubject = TextEditingController();


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
                         SizedBox(width: 20,),
                             Text("Detail Form" ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                      ],)
                    ),
                  )
,
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: Form(
                 key: globalKey,
                child: Column(children: [
                  TextFormField(
                   
                     validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else {
                        return null;
                      }
                     },
    
                    controller: fullName,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.abc,color: Colors.black,),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'Full Name ',
                        
                      
                     ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                     
                     validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else {
                        return null;
                      }
                     },
                    controller: semester,

                    decoration: InputDecoration(
                         prefixIcon: Icon(Icons.yard,color: Colors.black,),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'SEMESTER',
                      ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                        validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else {
                        return null;
                      }
                        },
    
                    controller: branch,
                    decoration: InputDecoration(
                          prefixIcon: Icon(Icons.energy_savings_leaf,color: Colors.black,),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'BRANCH',
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                   TextFormField(
                        validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      } else {
                        return null;
                      }
                        },
                    controller: totalSubject,
                    decoration: InputDecoration(
                       prefixIcon: Icon(Icons.book,color: Colors.black,),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'TOTAL SUBJECT',
                        
                        ),
                   ),
                     SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:50,left: 50),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromARGB(255, 45, 113, 169)),
                      height: 45,
                      width: 150,
                      child: MaterialButton(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          
                         if(globalKey.currentState!.validate())
                         {
                            CollectionReference collRef =
                                  FirebaseFirestore.instance.collection('User');
                              collRef.add({
                                'FullName': fullName.text.toString(),
                                'Semester':semester.text.toString(),
                                'Branch': branch.text.toString(),
                                'Totalsubject': totalSubject.text.toString()
                                
                              });
                      
                            Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(),));
                        
                         }
                        },
                      ),
                    ),
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
