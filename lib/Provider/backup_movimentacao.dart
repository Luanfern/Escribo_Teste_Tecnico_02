/* movimentacaoEixox(int casas, bool lado,bool jogador) {
    int vzs = 0;
    movi() {
      if (lado) {
        Timer.periodic(const Duration(milliseconds: 450), (Timer timer) {
          jogador == true ? setblocxJogador1(getblocxJogador1 - 0.1):
                            setblocxJogador2(getblocxJogador2 - 0.1);
          vzs++;
          if (vzs == casas) {
            vzs = 0;
            timer.cancel();
          }
        });
      } else {
        Timer.periodic(const Duration(milliseconds: 450), (Timer timer) {
          jogador == true ? setblocxJogador1(getblocxJogador1 + 0.1):
                            setblocxJogador2(getblocxJogador2 + 0.1);
          vzs++;
          if (vzs == casas) {
            vzs = 0;
            timer.cancel();
          }
        });
      }
    }

    movi();
  }

  movimentacaoEixoy(bool jogador) {
    movi() {
      Timer.periodic(const Duration(milliseconds: 450), (Timer timer) {
        jogador == true ? setblocyJogador1(getblocyJogador1 - 0.1):
                          setblocyJogador2(getblocyJogador2 - 0.1);
        timer.cancel();
      });
    }

    movi();
  }

  //esquerda
    esquerda(int qtdcasas, bool jogador){
      double blocx;
      double blocy;
       if (jogador == true) {
          blocx = getblocxJogador1;
          blocy = getblocyJogador1;
       }else{
          blocx = getblocxJogador2;
          blocy = getblocyJogador2;
       }

      print('getblocx: '+blocx.toString());
      int ondeestou = (blocx * 10).toInt();
      print("estou aqui: " + ( 10 - ondeestou ).toString());
      int verification = qtdcasas + ( 10 - (ondeestou));
      print('verificacao:'+ verification.toString());

      if(10 - ondeestou == 10){
        print('aqui eu subo');
         movimentacaoEixoy(jogador);
          Timer(const Duration(milliseconds: 450), () {
            int andarateSubir = qtdcasas - 1;
            print(andarateSubir);
            direita(andarateSubir, jogador);
          });
      }else if (verification > 10) {
         print('andar para subir');

         int paraSubir = 10 - (10 - ondeestou);
        print('anda ${paraSubir} para subir 1');
        movimentacaoEixox(paraSubir, colunaatual(jogador) == true ? true : false, jogador);
        Timer(Duration(milliseconds: (450 * paraSubir)), () {
          movimentacaoEixoy(jogador);
          Timer(const Duration(milliseconds: 450), () {
            if (paraSubir + 1 < qtdcasas) {
              print('andar mais ${qtdcasas - (paraSubir + 1)}');
              direita(qtdcasas - (paraSubir + 1), jogador);
              /* movimentacaoEixox(qtdcasas - (paraSubir + 1),
                  colunaatual() == true ? true : false);
              Timer(Duration(milliseconds: (450 * (qtdcasas - (paraSubir + 1)))),
                  () {
                print('acabei de andar ${qtdcasas - (paraSubir + 1)}');
              }); */
            }
          });
        });

      } else {
        print('apenas andar');
        movimentacaoEixox(qtdcasas, colunaatual(jogador) == true ? true : false, jogador);
      }
    }

    //direita
    direita(int qtdcasas, bool jogador){
      double blocx;
      double blocy;
       if (jogador == true) {
          blocx = getblocxJogador1;
          blocy = getblocyJogador1;
       }else{
          blocx = getblocxJogador2;
          blocy = getblocyJogador2;
       }

      print('getblocx: '+blocx.toString());
      int ondeestou = (blocx == 0.7999999999999999 ? 8 : blocx * 10).toInt();
      print("estou aqui: " + (ondeestou + 1).toString());
      int verification = qtdcasas + ondeestou + 1;
      print('verificacao:'+ verification.toString());

      if(ondeestou + 1 == 10){
        print('subir no proximo');
        movimentacaoEixoy(jogador);
          Timer(const Duration(milliseconds: 450), () {
            int andarateSubir = qtdcasas - 1;
            print(andarateSubir);
            esquerda(andarateSubir, jogador);
          });
      }
      else if (verification > 10) {
        int paraSubir = 10 - (ondeestou + 1);
        print('anda ${paraSubir} para subir 1');
        movimentacaoEixox(paraSubir, colunaatual(jogador) == true ? true : false, jogador);
        Timer(Duration(milliseconds: (450 * paraSubir)), () {
          movimentacaoEixoy(jogador);
          Timer(const Duration(milliseconds: 450), () {
            if (paraSubir + 1 < qtdcasas) {
              print('andar mais ${qtdcasas - (paraSubir + 1)}');
              esquerda(qtdcasas - (paraSubir + 1), jogador);
            }
          });
        });
      } else {
        movimentacaoEixox(qtdcasas, colunaatual(jogador) == true ? true : false, jogador);
      }
    }

  movimentacao(int casas, bool jogador) async {
    print(casas);
    print(jogador);
    if (colunaatual(jogador) == true) {
      esquerda(casas, jogador);

    } else {
      direita(casas, jogador);

    }
  }

  colunaatual(bool jogador) {
      if(jogador == true){
        if ((getblocyJogador1* 10).toInt() % 2 == 0) {
          return true;
        }
      }else{
        if ((getblocyJogador2* 10).toInt() % 2 == 0) {
          return true;
        }
      }
  } */