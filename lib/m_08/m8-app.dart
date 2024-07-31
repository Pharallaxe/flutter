import 'package:demo_flutter/m_08/m8-page-1.dart';
import 'package:demo_flutter/m_08/m8-page-2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DemoM8App());
}

class DemoM8App extends StatelessWidget {
  const DemoM8App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo M8',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => M08Page1(),
        "/page2" : (context) => M08Page2()
      }
    );
  }
}