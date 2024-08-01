import 'package:flutter/material.dart';

void main() {
  runApp(DemoM6ListViewApp());
}

class DemoM6ListViewApp extends StatelessWidget {
  const DemoM6ListViewApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo M06 listView',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DemoPageM06ListView(),
    );
  }
}

class DemoPageM06ListView extends StatefulWidget {
  const DemoPageM06ListView({super.key});

  @override
  State<DemoPageM06ListView> createState() => _DemoPageM06ListViewState();
}

class _DemoPageM06ListViewState extends State<DemoPageM06ListView> {

  var firstnames = ["Denis", "Etienne", "Julien", "Sylvain"];

  void refreshList() {
    // Vide la lide
    // Affiche un ecran de chargement

    // mettre à jour la liste des prenoms
    firstnames = ["Chocolatine", "Beurre doux"];

    // rafrachir la page
    setState(() {});

    // fermer l'ecran de chargement
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Demo M6 ListView"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: refreshList, child: Text("Refresh")),
          Expanded(child: ListView.builder(
              itemCount: firstnames.length,
              itemBuilder: (BuildContext context, int index) {
                var firstname = firstnames[index];
                return Text("Prenom: ${firstname}");
              }))
        ],
      ),
    );
  }
}