import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plebiscite/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plebiscito Chile 2020',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.APP_NAME),
      ),
      body: body(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: provider.next,
        //TODO: change to provider.tooltip
        tooltip: 'Votar',
        //TODO: change icon to
        child: Icon(Icons.add),
      ),
    );
  }

  Widget body(BuildContext context) {
    final screen = Provider.of<AppProvider>(context);

    if (screen.isWelcome()) return welcome();
    if (screen.isFirstAnswer()) return first(context);
    if (screen.isSecondAnswer()) return second(context);
    if (screen.isBallot()) return ballot(context);
    if (screen.isThanks()) return thanks(context);

    return Container();
  }

  Widget welcome() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          Constants.WELCOME_TEXT,
          textScaleFactor: 3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget first(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Column(
      children: <Widget>[
        Text(Constants.FIRST_QUESTION),
        RadioListTile(
          title: Text(Constants.APPROVE_TEXT),
          groupValue: provider.firstAnswer,
          onChanged: provider.setFirstAnswer,
          value: FirstAnswer.Approve,
        ),
        RadioListTile(
          title: Text(Constants.REJECT_TEXT),
          groupValue: provider.firstAnswer,
          onChanged: provider.setFirstAnswer,
          value: FirstAnswer.Reject,
        ),
      ],
    );
  }

  Widget second(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Column(
      children: <Widget>[
        Text(Constants.SECOND_QUESTION),
        RadioListTile(
          title: Text(Constants.CONSTITUTIONAL_CONVENTION_TEXT),
          groupValue: provider.secondAnswer,
          onChanged: provider.setSecondAnswer,
          value: SecondAnswer.NotMixed,
        ),
        RadioListTile(
          title: Text(Constants.MIX_CONSTITUTIONAL_CONVENTION_TEXT),
          groupValue: provider.secondAnswer,
          onChanged: provider.setSecondAnswer,
          value: SecondAnswer.Mixed,
        ),
      ],
    );
  }

  Widget ballot(BuildContext context) => Container();

  Widget thanks(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Gracias por participar'),
          Text('Respuestas'),
          Text(provider.firstAnswer.toString()),
          Text(provider.secondAnswer.toString()),
        ],
      ),
    );
  }
}
