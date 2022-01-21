import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snakesandladders_escribo/Provider/providergame.dart';

class Lobby extends StatefulWidget {
  const Lobby({Key? key}) : super(key: key);

  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  @override
  Widget build(BuildContext context) {
    final CobrasEscadas game = Provider.of(context);
    return Visibility(
      visible: game.getstart,
      child: Stack(
          children: [
            Container(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedRotation(
                  turns: game.getanimationstart == true ?4:0,
                  duration: const Duration(milliseconds: 1100),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 200,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(
                                color: const Color.fromARGB(255, 52, 129, 55),
                                width: 4,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/imgs/rosto_cobra.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 190,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomPaint(
                            size: const Size(200, 50),
                            painter: SplashPainter(),
                            child: Container(
                              padding: const EdgeInsets.only(top: 25, left: 40),
                              height: 50,
                              width: 200,
                              child: const Text(
                                'Escribo Teste 2',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
               Center(
                  child: Column(
                    children: const [
                      Text('Desenvolvido por',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                              Text('--> Luan Avila Fernandes <--',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1100),
                    child: GestureDetector(
                      onTap: () => {
                        game.stargamefunc(),
                      },
                      child: Container(
                        width: game.getanimationstart == true ?0:250,
                        height: game.getanimationstart == true ?0:80,
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
                          'Jogar',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
    );
  }
}

class SplashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 52, 129, 55)
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    path0.moveTo(size.width * 0.1748500, size.height * 0.6920000);
    path0.lineTo(size.width * 0.0213000, size.height * 0.3920000);
    path0.lineTo(size.width * 0.9772500, size.height * 0.3949000);
    path0.lineTo(size.width * 0.8361000, size.height * 0.6862000);
    path0.lineTo(size.width * 0.9808000, size.height * 0.9820000);
    path0.lineTo(size.width * 0.0192000, size.height * 0.9820000);
    path0.lineTo(size.width * 0.1748500, size.height * 0.6920000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
