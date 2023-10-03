import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  get isLoggedIn => null;

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<void>(
          future: login(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
             
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
            
              return SnackBar(content: Text('Error: ${snapshot.error}'));
            } else {
              
              return isLoggedIn
                  ? Text('Login Successful!')
                  : Text('Login Failed!');
            }
          },
        
      );
  }
  
  login() {}
}