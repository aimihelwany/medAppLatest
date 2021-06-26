import 'package:medicationinfosys/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:medicationinfosys/homepage.dart';
import 'package:provider/provider.dart';
import 'package:medicationinfosys/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    

    // return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
      
  }
}