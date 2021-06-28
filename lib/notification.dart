import 'package:flutter/material.dart';
import 'package:medicationinfosys/alarmPicker.dart';
import 'package:medicationinfosys/constants.dart';
import 'package:medicationinfosys/dosePicker.dart';
import 'package:medicationinfosys/sound.dart';
import 'package:medicationinfosys/timePicker.dart';
import 'package:medicationinfosys/dayProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationPage extends StatefulWidget {
  final DocumentSnapshot medications;

  NotificationPage({this.medications});
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.medications.data["medicationName"],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 1,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              color: kBackgroundColor,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  height: size.width * 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: <Widget>[
                          Container(
                            height: size.width * 0.4,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Image.network(
                            widget.medications.data["imageUrl"],
                            height: size.width * 0.45,
                            width: size.width * 0.45,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Days(),
                TimePicker(),
                DosePick(),
                SoundSection(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: FlatButton(
            color: kSecondaryColor,
            child: Text(
              'Set Reminder',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
