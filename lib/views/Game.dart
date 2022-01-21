import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:snakesandladders_escribo/Provider/providergame.dart';
import 'package:snakesandladders_escribo/views/Lobby.dart';
import 'package:snakesandladders_escribo/views/componentes/Animations/animationWinner.dart';
import 'package:snakesandladders_escribo/views/componentes/Animations/animationsContagem.dart';
import 'package:snakesandladders_escribo/views/componentes/Animations/animationsPLayer.dart';
import 'package:snakesandladders_escribo/views/componentes/Map.dart';
import 'package:snakesandladders_escribo/views/componentes/Animations/animationsMap.dart';
import 'package:snakesandladders_escribo/views/componentes/cardplayer.dart';
import 'package:snakesandladders_escribo/views/componentes/gridboard.dart';
import 'componentes/Animations/animationsLadder.dart';
import 'componentes/Animations/animationsSnake.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final CobrasEscadas game = Provider.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 54, 54, 54),
            padding: const EdgeInsets.only(top: 17),
            child: Column(
              children: [
                Expanded(
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: game.getwinon == false
                        ? const CardPlayer(
                            nome: 'Jogador 2',
                            peao: 'assets/imgs/peao2.png',
                            visibleArea: 2,
                            chanceType: false)
                        : Container(
                            color: const Color.fromARGB(0, 255, 255, 255),
                            child: Center(
                              child: game.getlastwinner == 1
                                  ? Lottie.network(
                                      'https://assets9.lottiefiles.com/packages/lf20_nwyegy0h.json',
                                      width: 100,
                                      height: 100)
                                  : Lottie.network(
                                      'https://assets8.lottiefiles.com/packages/lf20_cehxtohr.json',
                                      width: 100,
                                      height: 100),
                            ),
                          ),
                  ),
                ),
                Stack(
                  children: [
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInToLinear,
                      turns: game.getChance == true ? 0 : 0.5,
                      child: Stack(
                        children: [
                          const Map(),
                          GridBoard(
                              color: const Color.fromARGB(0, 255, 255, 255),
                              position: 79),
                          const AnimationPlayer(jogador: 2),
                          const AnimationPlayer(jogador: 1),
                          const AnimationsDices(),
                          const AnimationsSnake(),
                          const AnimationsLadder(),
                        ],
                      ),
                    ),
                    AnimationWinner(ganhador: game.getlastwinner),
                  ],
                ),
                Expanded(
                  child: game.getwinon == false
                      ? const CardPlayer(
                          nome: 'Jogador 1',
                          peao: 'assets/imgs/peao1.png',
                          visibleArea: 1,
                          chanceType: true)
                      : Container(
                          color: const Color.fromARGB(0, 255, 255, 255),
                          child: Center(
                            child: game.getlastwinner == 1
                                ? Lottie.network(
                                    'https://assets8.lottiefiles.com/packages/lf20_cehxtohr.json',
                                    width: 100,
                                    height: 100)
                                : Lottie.network(
                                    'https://assets9.lottiefiles.com/packages/lf20_nwyegy0h.json',
                                    width: 100,
                                    height: 100),
                          ),
                        ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: game.getanimationstart == true ? false : true,
            child: const Lobby(),
          ),
          Visibility(
            visible: game.getanimationstart == true ? true : false,
            child: const AnimationContagem(),
          ),
        ],
      ),
    );
  }
}
