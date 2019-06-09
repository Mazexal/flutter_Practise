import 'package:flutter/material.dart';

class SwitchAndCheckBox extends StatefulWidget {
  @override
  _SwitchAndCheckBox createState() {
    return _SwitchAndCheckBox();
  }
}

class _SwitchAndCheckBox extends State<SwitchAndCheckBox> {
  bool _checkboxVal = false;
  bool _switchboxVal = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchboxVal,
          onChanged: (val) {
            setState(() {
              _switchboxVal = val;
            });
          },
        ),
        Checkbox(
          value: _checkboxVal,
          onChanged: (val) {
            setState(() {
              _checkboxVal = val;
            });
          },
        )
      ],
    );
  }
}
