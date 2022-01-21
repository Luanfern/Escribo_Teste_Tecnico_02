import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:snakesandladders_escribo/Provider/providergame.dart';
import 'package:snakesandladders_escribo/views/Game.dart';
import 'package:snakesandladders_escribo/views/Lobby.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:MyApp(),
      ),
    );

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
       SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => CobrasEscadas()),
        ],
        child:const MaterialApp(
              debugShowCheckedModeBanner: false,
              home:  Navig(),
        ),
      );
    }
  }

  class Navig extends StatefulWidget {
  const Navig({ Key? key }) : super(key: key);

  @override
  _NavigState createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/game',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/game':
              return MaterialPageRoute(builder: (_) => const Game());
            default:
              return MaterialPageRoute(
                builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}