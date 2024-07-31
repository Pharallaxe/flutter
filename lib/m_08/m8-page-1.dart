import 'package:flutter/material.dart';

class M08Page1 extends StatelessWidget {

  // Fonction pour appeler une page.
  void onClickOpenPage(BuildContext context) {
    // Ouvrir la page
    Navigator.pushNamed(context, "/page2");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Page 1"),

            OutlinedButton(onPressed: () {onClickOpenPage(context);}, child: Text("Ouvrir page 2"))
          ],
        ),
      ),
    );
  }
}
