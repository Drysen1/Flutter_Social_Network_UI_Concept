import 'package:flutter/material.dart';
import 'package:flutter_social_network_ui_concept/screens/tabScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Color.fromARGB(255, 23, 23, 23),
        primaryColor: Color.fromARGB(255, 195, 165, 89),
        //primarySwatch: Colors.blue,
      ),
      home: TabScreen(),
    );
  }
}