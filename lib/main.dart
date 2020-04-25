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

  void _goToFirstQuestion() {}

  Widget body(BuildContext context) {
    final screen = Provider.of<AppProvider>(context);
    if (screen.isWelcome()) return welcome();
    if (screen.isBallot()) return welcome();

    return Container();
  }

  Widget welcome() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          Constants.WELCOME_TEXT,
          textScaleFactor: 3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}
