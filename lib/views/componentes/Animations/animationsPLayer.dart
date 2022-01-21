import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakesandladders_escribo/Provider/providergame.dart';
import 'package:snakesandladders_escribo/Variaveis/dados.dart';

class AnimationPlayer extends StatefulWidget {
  final int jogador;
  const AnimationPlayer({Key? key, required this.jogador}) : super(key: key);

  @override
  _AnimationPlayerState createState() => _AnimationPlayerState();
}

class _AnimationPlayerState extends State<AnimationPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width - 10,
      height: MediaQuery.of(context).size.width - 10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Stack(
        children: [
          MovimentationPlayer(jogador: widget.jogador),
        ],
      ),
    );
  }
}

class MovimentationPlayer extends StatefulWidget {
  final int jogador;
  const MovimentationPlayer({Key? key, required this.jogador})
      : super(key: key);

  @override
  State<MovimentationPlayer> createState() => _MovimentationPlayerState();
}

class _MovimentationPlayerState extends State<MovimentationPlayer> {
  @override
  Widget build(BuildContext context) {
    final CobrasEscadas game = Provider.of(context);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 350),
      top: widget.jogador == 1
          ? (MediaQuery.of(context).size.width - 12.5) * coordenadasMapa.elementAt(coordenadasMapa.indexWhere((element) => element.casa == game.getPosicaojogador1)).y
          : (MediaQuery.of(context).size.width - 12.5) * coordenadasMapa.elementAt(coordenadasMapa.indexWhere((element) => element.casa == game.getPosicaojogador2)).y,
      left: widget.jogador == 1
          ? (MediaQuery.of(context).size.width - 12.5) * coordenadasMapa.elementAt(coordenadasMapa.indexWhere((element) => element.casa == game.getPosicaojogador1)).x
          : (MediaQuery.of(context).size.width - 12.5) * coordenadasMapa.elementAt(coordenadasMapa.indexWhere((element) => element.casa == game.getPosicaojogador2)).x,
      curve: Curves.easeInOutQuad,
      child: SizedBox(
        width: (MediaQuery.of(context).size.width - 10) * 0.092,
        height: (MediaQuery.of(context).size.width - 10) * 0.092,
        //color: Colors.amber,
        child: Center(
          child: widget.jogador == 1
              ? Image.asset(
                  'assets/imgs/peao1.png',
                  width: (MediaQuery.of(context).size.width - 10) * 0.09,
                  height: (MediaQuery.of(context).size.width - 10) * 0.09,
                )
              : Image.asset(
                  'assets/imgs/peao2.png',
                  width: (MediaQuery.of(context).size.width - 10) * 0.09,
                  height: (MediaQuery.of(context).size.width - 10) * 0.09,
                ),
        ),
      ),
    );
  }
}
