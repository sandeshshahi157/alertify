// ignore_for_file: prefer_const_constructors



import 'package:alertify/views/LoginPage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 1), () {
     
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.3,
          ),
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/images/icon.png"),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.06,
          ),
          Center(
            child: Text(
              "Alertify",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: Color.fromARGB(255, 46, 90, 108)),
          height: 200,
          child: Center(
            child: Text(
              " " "Alerts for Academic Success" "",
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 254, 254),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
