import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicationinfosys/detailpage.dart';
import 'package:medicationinfosys/favList.dart';
import 'package:medicationinfosys/medicationItem.dart';
import 'package:medicationinfosys/notification.dart';
import 'package:medicationinfosys/operations.dart';
import 'package:medicationinfosys/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:medicationinfosys/constants.dart';

import 'package:medicationinfosys/auth.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'homePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String id;
  String name = "";
  final AuthService _auth = AuthService();
  navigateToDetail(DocumentSnapshot medications) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
                  medications: medications,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 80,
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      child: Icon(
                        Icons.list,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 30),
                      child: Text(
                        "MedInfoSys",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                color: kPrimaryColor,
              ),
              Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/user.png"),
                    height: 90,
                    width: 90,
                  ),
                  Text(
                    "Welcome nadiah@gmail.com !",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.orangeAccent,
                ),
                title: Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomePage.routeName);
                },
              ),
              Divider(
                height: 10,
                indent: 65,
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(
                  Icons.add_box,
                  color: Colors.orangeAccent,
                ),
                title: Text(
                  "My Medication",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavList()));
                },
              ),
              Divider(
                height: 10,
                indent: 65,
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(
                  Icons.alarm,
                  color: Colors.orangeAccent,
                ),
                title: Text(
                  "My Reminder",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
              Divider(
                height: 10,
                indent: 65,
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.orangeAccent,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Dashboard"),
          actions: <Widget>[],
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          children: <Widget>[
            SearchBox(
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: (name != "" && name != null)
                    ? Firestore.instance
                        .collection("medications")
                        .where("keywords", arrayContains: name)
                        .snapshots()
                    : Firestore.instance.collection("medications").snapshots(),
                builder: (context, snapshot) {
                  // return !snapshot.hasData
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot data =
                                snapshot.data.documents[index];

                            return InkWell(
                                onTap: () => navigateToDetail(
                                    snapshot.data.documents[index]),
                                child: MedicationItem(
                                  documentSnapshot: data,
                                  id: data.documentID,
                                  isFavourite: data['isFavourite'],
                                  imageUrl: data['imageUrl'],
                                  medicationName: data['medicationName'],
                                  purpose: data['purpose'],
                                ));
                          },
                        );
                },
              ),
            ),
          ],
        ));
  }
}
