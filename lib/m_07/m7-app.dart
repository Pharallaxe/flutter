import 'dart:js_interop';

import 'package:flutter/material.dart';

void main() {
  runApp(DemoM7App());
}

class DemoM7App extends StatelessWidget {
  const DemoM7App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo M07',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Clé/id du formulaire
  // ATTENTION : Il faut l'associer à un Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onSubmit() {
    // Enclencher la validation(return true = valide)
    if (_formKey.currentState!.validate()) {
      print("Formulaire valide");
    }
  }

  /**
   * Fonction de validation
   */
  String? validateViennoiserie(String? value){
    // Erreur 1
    if (value == null || value!.isEmpty){
      return "Vous devez saisir une valeur";
    }

    // Erreur 2
    if (value == "chocolatine"){
      return "Dégage de chez moi";
    }

    // Erreur 3
    if (value == "pizza ananas"){
      return "T'es qui en faît ?";
    }

    // Pas d'erreur
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Demo Validation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                validator: validateViennoiserie,
                decoration: InputDecoration(
                    labelText: "Viennoiserie",
                    hintText: "Veuillez saisir une viennoiserie"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                    onPressed: onSubmit,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Submit"),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}