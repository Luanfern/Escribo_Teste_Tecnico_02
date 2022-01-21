 import 'dart:async';
import 'dart:math';

bool start = true;
bool animationstart = false;

bool animationcontagem = false;
String contagem = '';

bool diceson = false;
bool dicesclose = true;

bool snakeon = false;
bool snakeclose = true;

bool laddereon = false;
bool ladderclose = true;


bool winon = false;
bool winclose = false;

int lastwinner = 0;

bool chance = true;

bool areaJogador1 = true;
bool areaJogador2 = true;

int randombranco = Random().nextInt(6);
int randompreto = Random().nextInt(6);

String mensagem = "...";

int posicaojogador1 = 0;
int posicaojogador2 = 0;

bool doanimation = false;

late Timer timerrandomnumbers;
