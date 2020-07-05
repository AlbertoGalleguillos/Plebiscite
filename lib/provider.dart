import 'package:flutter/widgets.dart';

enum Screen { Welcome, Ballot, First, Second, Thanks }
enum FirstAnswer { Approve, Reject }
enum SecondAnswer { Mixed, NotMixed }

class Constants {
  static const APP_NAME = 'Plebiscito Chile 2020';
  static const WELCOME_TEXT = 'Mañana (Hoy) debería haber sido el plebiscito'
      ' por una nueva constitución en Chile, el objetivo de esta página es'
      ' conocer que hubieran votado los ciudadanos';
  static const FIRST_QUESTION = '¿Quiere usted una nueva Constitución?';
  static const APPROVE_TEXT = 'Apruebo';
  static const REJECT_TEXT = 'Rechazo';
  static const SECOND_QUESTION =
      '¿Qué tipo de órgano debiera redactar la nueva Constitución?';
  static const CONSTITUTIONAL_CONVENTION_TEXT = 'Convención Constitucional';
  static const MIX_CONSTITUTIONAL_CONVENTION_TEXT =
      'Convención Mixta Constitucional';
}

class AppProvider extends ChangeNotifier {
  Screen screen = Screen.Welcome;
  FirstAnswer firstAnswer;
  SecondAnswer secondAnswer;

  bool isWelcome() => screen == Screen.Welcome;

  bool isBallot() => screen == Screen.Ballot;

  bool isFirstAnswer() => screen == Screen.First;

  bool isSecondAnswer() => screen == Screen.Second;

  bool isThanks() => screen == Screen.Thanks;

  void next() {
    switch (screen) {
      case Screen.Welcome:
        screen = Screen.First;
        break;
      case Screen.Ballot:
        screen = Screen.Welcome;
        break;
      case Screen.First:
        screen = Screen.Second;
        break;
      case Screen.Second:
        screen = Screen.Thanks;
        break;
      case Screen.Thanks:
        screen = Screen.Welcome;
        break;
    }
    notifyListeners();
  }

  void setFirstAnswer(FirstAnswer answer) {
    firstAnswer = answer;
    notifyListeners();
  }

  void setSecondAnswer(SecondAnswer answer) {
    secondAnswer = answer;
    notifyListeners();
  }
}
