
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:kuis/main_screen.dart';
import 'package:kuis/pokemon_data.dart';

class PokemonDetail extends StatefulWidget {
  final int pokedexID;

  const PokemonDetail({Key? key, required this.pokedexID}) : super(key: key);

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  bool toggle = false;



  Widget build(BuildContext context) {
    final PokemonData pokedex = listPokemon[widget.pokedexID];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Detail Pokemon"),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IconButton(
  icon: toggle ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
  onPressed: () {
    setState(() {
      toggle = !toggle;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(toggle ? "Tambahkan ke Favorit" : "Hapus Dari Favorit"),
        duration: Duration(seconds: 2),
      ),
    );
  },
),

            ),
          ],
        ),
        body: ListView(children: [
          Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image.network(
                        pokedex.image,
                        width: 300,
                      ),
                    ),
                    Text(
                      pokedex.name,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Center(
                        child: Column(children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        margin: EdgeInsets.all(20),
                        child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(50),
                            1: FlexColumnWidth(300),
                          },
                          children: [
                            TableRow(children: [
                              Column(
                                children: [Text("Type")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),                              
                            ]),

                            TableRow(children: [
                              Column(
                                children: [Text( "[ " + pokedex.type.join(", ") + " ]")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ]),

                            TableRow(children: [
                              Column(
                                children: [Text(" ")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),                              
                            ]),

                            TableRow(children: [
                              Column(
                                children: [Text("Weakness")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ]),

                            TableRow(children: [
                              Column(
                                children: [Text("[ " +pokedex.weakness.join(", ")+ " ]")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ]),

                            TableRow(children: [
                              Column(
                                children: [Text(" ")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),                              
                            ]),


                            TableRow(children: [
                              Column(
                                children: [Text("Previous Evolution")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ]),

                            TableRow(children: [
                              Column(
                                children: [Text("[ " +pokedex.prevEvolution.join(", ")+ " ]")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ]),

                            TableRow(children: [
                              Column(
                                children: [Text(" ")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),                              
                            ]),

                            TableRow(children: [
                              Column(
                                children: [Text("Next Evolution")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ]),

                            TableRow(children: [
                              Column(
                                children: [Text("[ " +pokedex.nextEvolution.join(", ")+" ]")],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ]),
                            
                          ],
                        ),
                      ),
                    ])),
                  ],
                ),
              ),
            ],
          )
        ]));
  }

  launch(String wikiUrl) {}
}