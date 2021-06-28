import 'package:flutter/material.dart';
import 'package:medicationinfosys/constants.dart';
import 'package:medicationinfosys/dayPicker.dart';
import 'package:provider/provider.dart';

class Days extends StatelessWidget {
  //const Days({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: 50,
          child: ListView(
            children: ListTile.divideTiles(tiles: [
              ListTile(
                title: Text('Days : '),
                onTap: () => _showMultipleChoiceDialog(context),
              ),
            ], context: context)
                .toList(),
          ),
        ),
      ],
    );
  }

  _showMultipleChoiceDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final _multipleNotifier = Provider.of<MultipleNotifier>(context);
        return AlertDialog(
          title: Text('Select the days'),
          content: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: days
                      .map((e) => CheckboxListTile(
                            title: Text(e),
                            onChanged: (value) {
                              value
                                  ? _multipleNotifier.addItem(e)
                                  : _multipleNotifier.removeItem(e);
                            },
                            value: _multipleNotifier.isHaveItem(e),
                          ))
                      .toList(),
                )),
          ),
          actions: [
            FlatButton(
              child: Text('Yes'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
