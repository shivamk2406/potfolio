import 'package:flutter/material.dart';
import 'package:newproject/Intro.dart';
import 'package:newproject/Screens/AuthScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newproject/Screens/DashBoard.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool init = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
          // initialData: Intro(),
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnapshot) {
            if (userSnapshot.hasData)
              return DashBoard();
            else
              return Intro();
          }),
      //MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
