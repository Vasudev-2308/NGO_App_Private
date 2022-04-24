import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({Key? key}) : super(key: key);

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
   int _groupValue = -1;
 

  List<String> returnableStatus = [
    'True',
    'False',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Returnable:"),
            ),
            Row(children: <Widget>[
              Expanded(
                flex: 1,
                child: RadioListTile(
                  value: 0,
                  groupValue: _groupValue,
                  title: Text(returnableStatus[0]),
                  onChanged: (int? newValue) =>
                      setState(() => _groupValue = newValue!),
                  activeColor: Colors.blue,
                  selected: false,
                ),
              ),
              Expanded(
                flex: 1,
                child: RadioListTile(
                  value: 1,
                  groupValue: _groupValue,
                  title: Text(returnableStatus[1]),
                  onChanged: (int? newValue) =>
                      setState(() => _groupValue = newValue!),
                  activeColor: Colors.blue,
                  selected: false,
                ),
              )
            ]),
          ],
        ));
  }
}
