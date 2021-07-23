import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations  App',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Localization'),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              Text(AppLocalizations.of(context).language,
                  style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              SizedBox(height: 90),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 4),
                child: Card(
                  color: Colors.black87,
                  child: Text(AppLocalizations.of(context).helloWorld,
                      style: TextStyle(
                          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ));
  }
}
