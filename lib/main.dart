import 'package:flutter/material.dart';
import 'package:missingcat_app/pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
        primarySwatch: Colors.green,
      ),
      //Turns on a little "DEBUG" banner in debug mode to indicate that the app
      //is in debug mode. This is on by default (in debug mode), to turn it off,
      //set the constructor argument to false.
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
