import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:snakesandladders_escribo/Variaveis/dados.dart';
import 'package:snakesandladders_escribo/Variaveis/variaveis.dart';

import '../../Provider/providergame.dart';

class CardPlayer extends StatefulWidget {
  final String nome;
  final String peao;
  final int visibleArea;
  final bool chanceType;
  const CardPlayer({
    Key? key,
    required this.nome,
    required this.peao,
    required this.visibleArea,
    required this.chanceType,
  }) : super(key: key);

  @override
  _CardPlayerState createState() => _CardPlayerState();
}

class _CardPlayerState extends State<CardPlayer> {
  @override
  Widget build(BuildContext context) {
    final CobrasEscadas game = Provider.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 54, 54, 54),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
            margin: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                )
              ],
            ),
            child: Column(
              children: [
                Text(
                  widget.nome,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 109, 109, 109),
                ),
                Image.asset(widget.peao,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.width * 0.2),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 58,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              dadosbrancos[game.getRandombranco],
                              scale: 5,
                            ),
                            const Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              dadospretos[game.getRandompreto],
                              scale: 5,
                            ),
                            Text(
                              '= ' +
                                  game
                                      .jogar(game.getRandombranco + 1,
                                          game.getRandompreto + 1)
                                      .toString(),
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: const Color.fromARGB(255, 75, 75, 75)),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 3, bottom: 3, left: 4, right: 4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: game.getMensagem == "..." ?
                                  Center(
                                    child: Lottie.network('https://assets5.lottiefiles.com/private_files/lf30_pidikbny.json'),
                                  ):
                                  Text(
                                    game.getMensagem,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                  padding: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(34, 37, 37, 37),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.visibleArea == 1
                      ? game.getAreaJogador1
                      : game.getAreaJogador2,
                  child: GestureDetector(
                    onTap: () {
                      if (game.getChance == widget.chanceType) {
                        if (game.getDiceson == false) {
                          game.vezdojogador(widget.chanceType);
                        }
                      }
                    },
                    child: Container(
                      height: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          widget.visibleArea == 1
                              ? Row(
                                  children: [
                                    if (game.getChance == true)
                                      const Text(
                                        'Sua vez.\nToque para Jogar',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    if (game.getChance == false)
                                      const Text(
                                        'Vez do Jogador 2',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    if (game.getChance == false)
                                      const Text(
                                        'Sua vez.\nToque para Jogar',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    if (game.getChance == true)
                                      const Text(
                                        'Vez do Jogador 1',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  ],
                                ),
                          Image.asset(
                            'assets/imgs/dadoplay.png',
                            scale: 8,
                          ),
                        ],
                      ),
                      margin:
                          const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(240, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
