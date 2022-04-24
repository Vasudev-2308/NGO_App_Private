import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:unitapp/Screens/UI/dropdownmenu.dart';
import 'package:unitapp/Screens/UI/radiobutton.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: const <Widget>[
        DropDownMenu(),
        RadioButtonWidget()
    ]);
  }
}
