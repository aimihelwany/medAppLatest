import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SoundSection extends StatefulWidget {
  //const SoundSection({ Key? key }) : super(key: key);

  @override
  _SoundSectionState createState() => _SoundSectionState();
}

class _SoundSectionState extends State<SoundSection> {
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("On"),
    1: Text("Off"),
  };
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 150,
          child: ListTile(
            title: Text(
              'Set Sound',
            ),
          ),
        ),
        CupertinoSlidingSegmentedControl(
            thumbColor: Colors.blue,
            groupValue: segmentedControlGroupValue,
            children: myTabs,
            onValueChanged: (i) {
              setState(() {
                segmentedControlGroupValue = i;
              });
            }),
      ],
    );
  }
}
