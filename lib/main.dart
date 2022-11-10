import 'package:bitirme_projesi/screens/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routes:{
        "/" :(BuildContext context)=>LoginScreen(),
      },initialRoute: "/",
    );
    }

}

