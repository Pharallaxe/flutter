import 'package:flutter/material.dart';

void main() {
  runApp(DemoFront1App());
}

class DemoFront1App extends StatelessWidget {
  const DemoFront1App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Front1 App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DemoFrontPage(),
    );
  }
}

class DemoFrontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Demo Front 1"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "mobile_background.jpg",
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Text(
                  "Titre de la page",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text("Description de la page",
                  style: TextStyle(color: Colors.white)),
              TextField(
                decoration:
                InputDecoration(
                    labelStyle: TextStyle(color: Color(0xFFDDDDDD)),
                    labelText: "Email",
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Veuillez saisir Email"),
              )
            ],
          )
        ],
      ),
    );
  }
}