import 'package:flutter/material.dart';
import 'package:medicationinfosys/wrapper.dart';
import 'package:medicationinfosys/auth.dart';
import 'package:provider/provider.dart';
import 'package:medicationinfosys/user.dart';
import 'homepage.dart';
import 'package:medicationinfosys/dayPicker.dart';
import 'package:medicationinfosys/notification.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SingleNotifier>(
        create: (_) => SingleNotifier(),
      ),
      ChangeNotifierProvider<MultipleNotifier>(
        create: (_) => MultipleNotifier([]),
      )
    ],
    child: MedApp(),
  ));
}

class MedApp extends StatefulWidget {
  @override
  _MedAppState createState() => _MedAppState();
}

class _MedAppState extends State<MedApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
