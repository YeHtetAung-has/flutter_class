
import 'package:firsttry/screens/home.dart';
import 'package:flutter/material.dart';

class MyFirstApp extends StatelessWidget{

  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: "My First App Demo",
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.orange)
      ),
      home: MyHomePage(title: "My First App"),
    );

  }

}