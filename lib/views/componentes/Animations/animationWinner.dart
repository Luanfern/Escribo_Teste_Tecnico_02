import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:snakesandladders_escribo/Provider/providergame.dart';

class AnimationWinner extends StatefulWidget {
  final int ganhador;
  const AnimationWinner({Key? key, required this.ganhador}) : super(key: key);

  @override
  _AnimationWinnerState createState() => _AnimationWinnerState();
}

class _AnimationWinnerState extends State<AnimationWinner> {
  @override
  Widget build(BuildContext context) {
    final CobrasEscadas game = Provider.of(context);
    return Visibility(
      visible: game.getwinon,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: game.getwinon ? 1.0 : 0.0,
        child: Container(
          margin: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width - 10,
          height: MediaQuery.of(context).size.width - 10,
          decoration: BoxDecoration(
            color: const Color(0xB53A3A3A),
            border: Border.all(color: Colors.black, width: 15),
            image: const DecorationImage(
              image: AssetImage('assets/imgs/tabuleiro.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.ganhador == 1
                      ? Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width,
                          color: const Color.fromARGB(204, 0, 0, 0),
                          child: const Center(
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Text(
                                'Voce Perdeu',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 65,
                          width: MediaQuery.of(context).size.width,
                          color: const Color.fromARGB(204, 0, 0, 0),
                          child: const Center(
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Text(
                                'Voce Ganhou',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: widget.ganhador != 1
                        ? Container(
                            height: 65,
                            width: MediaQuery.of(context).size.width,
                            color: const Color.fromARGB(204, 0, 0, 0),
                            child: const Center(
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Text(
                                  'Voce Perdeu',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 65,
                            width: MediaQuery.of(context).size.width,
                            color: const Color.fromARGB(204, 0, 0, 0),
                            child: const Center(
                              child: RotatedBox(
                                quarterTurns: 2,
                                child: Text(
                                  'Voce Ganhou',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              Center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 1.6,
                        child: Stack(
                          children: [
                            Center(
                              child: widget.ganhador == 1
                                  ? Image.asset(
                                      'assets/imgs/peao1.png',
                                      height: 80,
                                      width: 80,
                                    )
                                  : Image.asset(
                                      'assets/imgs/peao2.png',
                                      height: 80,
                                      width: 80,
                                    ),
                            ),
                            Lottie.network(
                              'https://assets4.lottiefiles.com/packages/lf20_fixmre.json',
                              height: MediaQuery.of(context).size.width,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => {
                          game.playagain()
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.8,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 4.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: Offset(
                                  0.0, // Move to right 10  horizontally
                                  0.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                          ),
                          child: const Center(
                              child: Text(
                            'Jogar Novamente',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
