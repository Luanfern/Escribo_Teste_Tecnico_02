List<String> dadosbrancos = [
  'assets/imgs/dado_branco1.png',
  'assets/imgs/dado_branco2.png',
  'assets/imgs/dado_branco3.png',
  'assets/imgs/dado_branco4.png',
  'assets/imgs/dado_branco5.png',
  'assets/imgs/dado_branco6.png',
];

List<String> dadospretos = [
  'assets/imgs/dado_preto1.png',
  'assets/imgs/dado_preto2.png',
  'assets/imgs/dado_preto3.png',
  'assets/imgs/dado_preto4.png',
  'assets/imgs/dado_preto5.png',
  'assets/imgs/dado_preto6.png',
];

List<int> snakes = [16, 46, 49, 62, 64, 74, 89, 92, 95, 99];
List<int> snakes_end = [6, 25, 11, 19, 60, 53, 68, 88, 75, 80];

List<int> ladders = [2, 7, 8, 15, 21, 28, 36, 51, 71, 78, 87];
List<int> ladders_end = [38, 14, 31, 26, 42, 84, 44, 67, 91, 98, 94];

class Coordenate {
  final int casa;
  final double x;
  final double y;

  Coordenate(this.casa, this.x, this.y);
}

List<Coordenate> coordenadasMapa = [
   Coordenate(0, -0.1, 0.9)
];

