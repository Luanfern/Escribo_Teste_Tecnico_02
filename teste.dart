class Coordenate {
  final int casa;
  final double x;
  final double y;

  Coordenate(this.casa, this.x, this.y);
}

List<Coordenate> coordenadasMapa = [];

void main() {
  mapearMapa() {
    int tot = 10;
    int casa = 100;
    for (var y = 0; y < 10; y++) {
      for (var x = 0; x < 10; x++) {
        num xx = y % 2 == 0 ? x : --tot;
        coordenadasMapa
            .add(Coordenate(casa, (xx/10).toDouble(), (y/10).toDouble()));
        casa--;
      }
      tot = 10;
    }
    coordenadasMapa
            .add(Coordenate(0, -0.1, 0.0));
  }

  mapearMapa();
  print('inicio');
  print(coordenadasMapa.elementAt(0).casa);
  /* coordenadasMapa.forEach((element) {
    print(
      element.casa.toString() +
        ': ' +
        (element.y/10).toString() +
        ' , ' +
        (element.x/10).toString());
  }); */
}
