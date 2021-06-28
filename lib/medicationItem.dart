import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicationinfosys/homepage.dart';
import 'package:medicationinfosys/operations.dart';
import 'package:flutter/material.dart';

class MedicationItem extends StatefulWidget {
  final String medicationName;
  final String imageUrl;
  final bool isFavourite;
  final String id;
  final String purpose;
  final DocumentSnapshot documentSnapshot;
  MedicationItem({
    @required this.imageUrl,
    @required this.documentSnapshot,
    @required this.id,
    @required this.isFavourite,
    @required this.medicationName,
    @required this.purpose,
  });

  @override
  _MedicationItemState createState() => _MedicationItemState();
}

class _MedicationItemState extends State<MedicationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Container(
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          widget.medicationName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          widget.purpose,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          editMedication(widget.isFavourite, widget.id);
                        },
                        icon: widget.isFavourite
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.redAccent,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
      ),
    );
  }
}
