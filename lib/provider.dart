import 'package:flutter/widgets.dart';

enum Screen {
  Welcome,
  Ballot,
}

class Constants {
  static const APP_NAME = 'Plebiscito Chile 2020';
  static const WELCOME_TEXT = 'Mañana (Hoy) debería haber sido el plebiscito'
      ' por una nueva constitución en Chile, el objetivo de esta página es'
      ' conocer que hubieran votado los ciudadanos';
}

class AppProvider extends ChangeNotifier {
  Screen screen = Screen.Welcome;

  bool isWelcome() => screen == Screen.Welcome;

  bool isBallot() => screen == Screen.Welcome;

  void next() {
    switch (screen) {
      case Screen.Welcome:
        screen = Screen.Ballot;
        break;
      case Screen.Ballot:
        screen = Screen.Welcome;
        break;
    }
    notifyListeners();
  }
}
