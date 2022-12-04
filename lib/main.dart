import 'package:flutter/material.dart';
import 'pages/SchedulePage.dart';
import 'pages/LoginPage.dart';
import 'pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(title: 'Flutter Form'),
      },
      home: const LoginPage(title: 'Flutter Authorization'),
    );
  }
}
