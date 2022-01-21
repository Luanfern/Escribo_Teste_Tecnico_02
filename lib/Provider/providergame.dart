import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snakesandladders_escribo/Variaveis/dados.dart';
import 'package:snakesandladders_escribo/Variaveis/variaveis.dart';

class CobrasEscadas with ChangeNotifier {
  int jogar(dado1, dado2) {
    return dado1 + dado2;
  }

  void setDiceson(bool param) {
    diceson = param;
    notifyListeners();
  }

  bool get getDiceson {
    return diceson;
  }

  void setDicesclose(bool param) {
    dicesclose = param;
    notifyListeners();
  }

  bool get getDicesclose {
    return dicesclose;
  }

  void setRandombranco(int param) {
    randombranco = param;
    notifyListeners();
  }

  int get getRandombranco {
    return randombranco;
  }

  void setRandompreto(int param) {
    randompreto = param;
    notifyListeners();
  }

  int get getRandompreto {
    return randompreto;
  }

  void setChance(bool param) {
    chance = param;
    notifyListeners();
  }

  bool get getChance {
    return chance;
  }

  void setMensagem(String param) {
    mensagem = param;
    notifyListeners();
  }

  String get getMensagem {
    return mensagem;
  }

  int get getPosicaojogador1 {
    return posicaojogador1;
  }

  void setPosicaojogador1(int param) {
    posicaojogador1 = param;
    notifyListeners();
  }

  int get getPosicaojogador2 {
    return posicaojogador2;
  }

  void setPosicaojogador2(int param) {
    posicaojogador2 = param;
    notifyListeners();
  }

  bool get getdoanimation {
    return doanimation;
  }

  void setdoanimation(bool param) {
    doanimation = param;
    notifyListeners();
  }

  bool get getAreaJogador1 {
    return areaJogador1;
  }

  void setAreaJogador1(bool param) {
    areaJogador1 = param;
    notifyListeners();
  }

  bool get getAreaJogador2 {
    return areaJogador2;
  }

  void setAreaJogador2(bool param) {
    areaJogador2 = param;
    notifyListeners();
  }

  iniciarRandomDices() {
    timerrandomnumbers =
        Timer.periodic(const Duration(milliseconds: 200), (timer) {
      setRandombranco(Random().nextInt(6));
      setRandompreto(Random().nextInt(6));
    });
  }

  finalizarRandomDices() {
    timerrandomnumbers.cancel();
  }

  bool dadosiguais() {
    if (getRandombranco == getRandompreto) {
      return true;
    } else {
      return false;
    }
  }

  bool get getsnakeon {
    return snakeon;
  }

  void setsnakeon(bool param) {
    snakeon = param;
    notifyListeners();
  }

  bool get getladdereon {
    return laddereon;
  }

  void setladdereon(bool param) {
    laddereon = param;
    notifyListeners();
  }

  bool get getsnakeclose {
    return snakeclose;
  }

  void setsnakeclose(bool param) {
    snakeclose = param;
    notifyListeners();
  }

  bool get getladderclose {
    return ladderclose;
  }

  void setladderclose(bool param) {
    ladderclose = param;
    notifyListeners();
  }

  bool get getwinon {
    return winon;
  }

  void setwinon(bool param) {
    winon = param;
    notifyListeners();
  }

  bool get getwinclose {
    return winclose;
  }

  void setwinclose(bool param) {
    winclose = param;
    notifyListeners();
  }

  int get getlastwinner {
    return lastwinner;
  }

  void setlastwinner(int param) {
    lastwinner = param;
    notifyListeners();
  }

  bool get getstart {
    return start;
  }

  void setstart(bool param) {
    start = param;
    notifyListeners();
  }

  bool get getanimationstart {
    return animationstart;
  }

  void setanimationstart(bool param) {
    animationstart = param;
    notifyListeners();
  }

  bool get getanimationcontagem {
    return animationcontagem;
  }

  void setanimationcontagem(bool param) {
    animationcontagem = param;
    notifyListeners();
  }

  String get getcontagem {
    return contagem;
  }

  void setcontagem(String param) {
    contagem = param;
    notifyListeners();
  }

  playagain() {
    setanimationcontagem(true);
    notifyListeners();
    int cont = 3;
    Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) {
      setcontagem(cont.toString());
      notifyListeners();
      if (cont == 0) {
        timer.cancel();
        setcontagem('START');
        setwinon(false);
        setwinclose(false);
        setlastwinner(0);
        setChance(true);
        setAreaJogador1(true);
        setAreaJogador2(true);
        Timer(const Duration(milliseconds: 1000), () {
          setanimationcontagem(false);
          notifyListeners();
          setcontagem('');

          //Restart
          setPosicaojogador1(0);
          setPosicaojogador2(0);
          setdoanimation(false);
          setDiceson(false);
          setDicesclose(true);
          setsnakeon(false);
          setsnakeclose(true);
          setladdereon(false);
          setladderclose(true);
          setRandombranco(Random().nextInt(6));
          setRandompreto(Random().nextInt(6));
          setMensagem("...");
        });
      }
      cont--;
    });
  }

  stargamefunc() {
    setanimationstart(true);
    Timer(const Duration(milliseconds: 1100), () {
      setstart(true);
    });
    Timer(const Duration(milliseconds: 300), () {
      setanimationcontagem(true);
      notifyListeners();
    });
    int cont = 3;
    Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) {
      setcontagem(cont.toString());
      notifyListeners();
      if (cont == 0) {
        timer.cancel();
        setcontagem('START');
        Timer(const Duration(milliseconds: 1000), () {
          setanimationcontagem(false);
          notifyListeners();
          setcontagem('');
        });
      }
      cont--;
    });
  }

  displaywin() {
    setwinon(true);
    setwinclose(true);
  }

  movimentar(casas, bool jogador) {
    int vzs = 0;

    jogador == true ? print('JOGADOR 1') : print('JOGADOR 2');

    jogador == true
        ? Timer.periodic(Duration(milliseconds: (450).toInt()), (Timer timer) {
            print('no timer 1');
            if (getPosicaojogador1 == 100) {
              timer.cancel();
              print('faltam ${casas - vzs} para andar');
              int faltam = casas - vzs;
              if (faltam > 0) {
                print('voltando $faltam casas');
                vzs = 0;
                Timer.periodic(const Duration(milliseconds: 450),
                    (Timer timer) {
                  setPosicaojogador1(getPosicaojogador1 - 1);
                  print('coordinates: ' + getPosicaojogador1.toString());
                  vzs++;
                  if (vzs == faltam) {
                    timer.cancel();
                    print('acabou a rodada');
                  }
                });
              } else if (casas - vzs == 0) {
                print('Este jogador ganhou');
              }
            } else {
              setPosicaojogador1(getPosicaojogador1 + 1);
              print('coordinates: ' + getPosicaojogador1.toString());
              vzs++;
              if (vzs == casas) {
                if (getPosicaojogador1 == 100) {
                  //ganha somente neste momento ---->
                  print('Este jogador ganhou');
                  Timer(const Duration(milliseconds: 600), () {
                    setlastwinner(1);
                    displaywin();
                  });
                  //ganha somente neste momento ---->
                }
                vzs = 0;
                timer.cancel();
              }
            }
          })
        : Timer.periodic(Duration(milliseconds: (450).toInt()), (Timer timer) {
            print('no timer 1');
            if (getPosicaojogador2 == 100) {
              timer.cancel();
              print('faltam ${casas - vzs} para andar');
              int faltam = casas - vzs;
              if (faltam > 0) {
                print('voltando $faltam casas');
                vzs = 0;
                Timer.periodic(const Duration(milliseconds: 450),
                    (Timer timer) {
                  setPosicaojogador2(getPosicaojogador2 - 1);
                  print('coordinates: ' + getPosicaojogador2.toString());
                  vzs++;
                  if (vzs == faltam) {
                    timer.cancel();
                    print('acabou a rodada');
                  }
                });
              } else if (casas - vzs == 0) {
                print('Este jogador ganhou');
              }
            } else {
              setPosicaojogador2(getPosicaojogador2 + 1);
              print('coordinates: ' + getPosicaojogador2.toString());
              vzs++;
              if (vzs == casas) {
                if (getPosicaojogador2 == 100) {
                  //ganha somente neste momento ---->
                  print('Este jogador ganhou');
                  Timer(const Duration(milliseconds: 600), () {
                    setlastwinner(2);
                    displaywin();
                  });
                  //ganha somente neste momento ---->
                }
                vzs = 0;
                timer.cancel();
              }
            }
          });
  }

  movimentacao(int casas, bool jogador) async {
    print(casas);
    jogador == true ? print('jogador1') : print('jogador2');
    if (jogador == true) {
      print('andar jogador 1');
      movimentar(casas, jogador);
    } else {
      print('andar jogador 2');
      movimentar(casas, jogador);
    }
  }

  displaysnake() {
    setsnakeon(true);
    setsnakeclose(true);

    Timer(const Duration(milliseconds: 2650), () {
      setsnakeclose(false);
      Timer(const Duration(milliseconds: 800), () {
        setsnakeon(false);
      });
    });
  }

  displayladder() {
    setladdereon(true);
    setladderclose(true);

    Timer(const Duration(milliseconds: 2650), () {
      setladderclose(false);
      Timer(const Duration(milliseconds: 800), () {
        setladdereon(false);
      });
    });
  }

  verificarmomentoescadasecobras() {
    if (snakes.contains(getPosicaojogador1)) {
      displaysnake();
      Timer(const Duration(milliseconds: 3450), () {
        setPosicaojogador1(snakes_end[snakes.indexOf(getPosicaojogador1)]);
      });
      return true;
    }
    if (ladders.contains(getPosicaojogador1)) {
      displayladder();
      Timer(const Duration(milliseconds: 3450), () {
        setPosicaojogador1(ladders_end[ladders.indexOf(getPosicaojogador1)]);
      });
      return true;
    }
    if (snakes.contains(getPosicaojogador2)) {
      displaysnake();
      Timer(const Duration(milliseconds: 3450), () {
        setPosicaojogador2(snakes_end[snakes.indexOf(getPosicaojogador2)]);
      });
      return true;
    }
    if (ladders.contains(getPosicaojogador2)) {
      displayladder();
      Timer(const Duration(milliseconds: 3450), () {
        setPosicaojogador2(ladders_end[ladders.indexOf(getPosicaojogador2)]);
      });
      return true;
    }
  }

  trocarjogadordarodada() {
    if (dadosiguais() == false) {
      mensagemparajogadores();
      setChance(!getChance);
    } else {
      setMensagem(getChance == false
          ? 'Jogador 2 esta na casa ' +
              getPosicaojogador2.toString() +
              '\nDados iguais, Jogador 2 pode jogar novamente'
          : 'Jogador 1 esta na casa ' +
              getPosicaojogador1.toString() +
              '\nDados iguais, Jogador 1 pode jogar novamente');
    }
  }

  mensagemparajogadores() {
    setMensagem(getChance == false
        ? 'Jogador 2 esta na casa ' + getPosicaojogador2.toString()
        : 'Jogador 1 esta na casa ' + getPosicaojogador1.toString());
  }

  vezdojogador(bool chanceType) {
    setDiceson(true);
    setDicesclose(true);

    setdoanimation(true);
    iniciarRandomDices();

    print('inicio dados');

    Timer(const Duration(milliseconds: 1000), () {
      setdoanimation(false);
      finalizarRandomDices();
      print('resultado dados');

      Timer(const Duration(milliseconds: 1300), () {
        print('inicio animação fade out');
        setDicesclose(false);

        Timer(const Duration(milliseconds: 800), () {
          print('termino animação fade out');
          setAreaJogador1(false);
          setAreaJogador2(false);
          setDiceson(false);
          movimentacao(jogar(randombranco + 1, randompreto + 1), chanceType);
          Timer(
              Duration(
                  milliseconds: 450 *
                      (jogar(randombranco + 1, randompreto + 1) + 2)), () {
            int sec = 450;
            verificarmomentoescadasecobras() == true ? sec = 4200 : sec = 0;
            Timer(Duration(milliseconds: sec), () {
              sec = 2500;
              trocarjogadordarodada();
              Timer(Duration(milliseconds: sec), () {
                print('retomar game');
                setAreaJogador1(true);
                setAreaJogador2(true);
                setMensagem("...");
              });
            });
          });
        });
      });
    });
  }

  mapearMapa() {
    int tot = 10;
    int casa = 100;
    for (var y = 0; y < 10; y++) {
      for (var x = 0; x < 10; x++) {
        num xx = y % 2 == 0 ? x : --tot;
        coordenadasMapa
            .add(Coordenate(casa, (xx / 10).toDouble(), (y / 10).toDouble()));
        casa--;
      }
      tot = 10;
    }
    coordenadasMapa.add(Coordenate(0, -0.1, 0.0));
  }
}
