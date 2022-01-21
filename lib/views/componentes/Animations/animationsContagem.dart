import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakesandladders_escribo/Provider/providergame.dart';

class AnimationContagem extends StatefulWidget {
  const AnimationContagem({Key? key}) : super(key: key);

  @override
  _AnimationContagemState createState() => _AnimationContagemState();
}

class _AnimationContagemState extends State<AnimationContagem> {
  @override
  Widget build(BuildContext context) {
    final CobrasEscadas game = Provider.of(context);
    return Visibility(
      visible: game.getanimationcontagem,
      child: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
          ),
          Center(
            child: Text(game.getcontagem.toString(), style: const TextStyle(fontSize: 100, color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
