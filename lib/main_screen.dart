import 'package:kuis/pokemon_detail.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:kuis/pokemon_data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Pokedex"),
      ),
      body: GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    childAspectRatio: 3 / 4,
  ),
  itemBuilder: (context, index) {
    final PokemonData place = listPokemon[index];
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PokemonDetail(pokedexID: index);
        }));
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.network(
                place.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(place.name),
                  SizedBox(height: 4),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
  itemCount: listPokemon.length,
),

    );
  }

  launch(String wikiUrl) {}
}