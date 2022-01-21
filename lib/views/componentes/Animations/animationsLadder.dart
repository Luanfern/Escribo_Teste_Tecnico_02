import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:snakesandladders_escribo/Provider/providergame.dart';

class AnimationsLadder extends StatefulWidget {
  const AnimationsLadder({Key? key}) : super(key: key);

  @override
  _AnimationsLadderState createState() => _AnimationsLadderState();
}

class _AnimationsLadderState extends State<AnimationsLadder> {
  @override
  Widget build(BuildContext context) {
    final CobrasEscadas game = Provider.of(context);
    return Visibility(
      visible: game.getladdereon,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: game.getladderclose ? 1.0 : 0.0,
        child: Container(
          margin: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width - 10,
          height: MediaQuery.of(context).size.width - 10,
          color: const Color(0xB53A3A3A),
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(204, 0, 0, 0),
                    child: const Center(
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Text(
                          'Ladder',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(204, 0, 0, 0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Ladder',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Stack(
                  children: [
                    Image.asset('assets/imgs/ladder.png',
                    height: MediaQuery.of(context).size.width - 110,
                    width: MediaQuery.of(context).size.width - 110,
                    ),
                    Lottie.network(
                      'https://assets4.lottiefiles.com/packages/lf20_noyzw8ub.json',
                      height: MediaQuery.of(context).size.width - 110,
                      width: MediaQuery.of(context).size.width - 110,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
