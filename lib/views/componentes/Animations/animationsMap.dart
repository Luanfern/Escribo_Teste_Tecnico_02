import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/providergame.dart';
import '../../../Variaveis/dados.dart';

class AnimationsDices extends StatefulWidget {
  const AnimationsDices({Key? key}) : super(key: key);

  @override
  _AnimationsDicesState createState() => _AnimationsDicesState();
}

class _AnimationsDicesState extends State<AnimationsDices>
    with SingleTickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CobrasEscadas game = Provider.of(context);
    if (game.getdoanimation) {
      controller.forward();
      controller.repeat();
    } else {
      controller.reset();
    }
    return Visibility(
      visible: game.getDiceson,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 800),
        opacity: game.getDicesclose ? 1.0 : 0.0,
        child: Container(
          margin: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width - 10,
          height: MediaQuery.of(context).size.width - 10,
          color: const Color(0xB53A3A3A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                child: Image.asset(
                  dadosbrancos[game.getRandombranco],
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.35,
                ),
              ),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                child: Image.asset(
                  dadospretos[game.getRandompreto],
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.width * 0.35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
