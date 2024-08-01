import 'package:demo_flutter/m_09/movie.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(DemoM09ApiApp());
}

class DemoM09ApiApp extends StatelessWidget {
  const DemoM09ApiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo M09 Api App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DemoPageM0ApiPage(),
    );
  }
}

class DemoPageM0ApiPage extends StatefulWidget {
  const DemoPageM0ApiPage({super.key});

  @override
  State<DemoPageM0ApiPage> createState() => _DemoPageM0ApiPageState();
}

class _DemoPageM0ApiPageState extends State<DemoPageM0ApiPage> {

  void callApi(BuildContext context) async {
    // Appeler une url en GET
    var url = Uri.parse("https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/movies.json");

    // on attend de recevoir la réponse reponse http (d'ou le await)
    var response = await http.get(url);

    // Affiche le body de réponse http (en json)
    var responseBodyJson = convert.jsonDecode(response.body);

    // ======================
    // POUR LA DEMO => A NE PAS FAIRE
    print(responseBodyJson);

    print(responseBodyJson[0]['title']);

    var unFilmEnJson = responseBodyJson[0];
    print(unFilmEnJson['title']);

    // Convertir un json en film (1)
    var movie = Movie.fromJson(responseBodyJson[0]);
    print(movie.description);

    // ==========================

    // Convertir une liste de JSON en liste de Film (plusieurs)
    // transformer chaque occurance en un autre objet implicitement
    List<Movie> movies = List<Movie>.from(responseBodyJson.map((movieJson) => Movie.fromJson(movieJson)).toList());

    for(var movie in movies){
      print("Le film est : ${movie.title}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Demo API"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                callApi(context);
              },
              child: Text("Appel Api")),
        ],
      ),
    );
  }
}