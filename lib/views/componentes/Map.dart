import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakesandladders_escribo/Provider/providergame.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    final CobrasEscadas game = Provider.of(context);
    game.mapearMapa();
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width - 10,
      height: MediaQuery.of(context).size.width - 10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        image: const DecorationImage(
          image: AssetImage('assets/imgs/tabuleiro.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
