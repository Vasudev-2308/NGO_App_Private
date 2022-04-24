import 'package:flutter/material.dart';
import 'package:unitapp/Screens/UI/bottommodelsheet.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ),
  ),
                  context: context,
                  builder: (BuildContext context) {
                    return DraggableScrollableSheet(
                      maxChildSize: 1.0,
                      builder: (BuildContext context, scrollController){
                        return  SingleChildScrollView(
                          controller: scrollController,
                          child: const FormWidget(),
                        );
                      }
                      );
                  });
            },
            child: const Text("Fill Form")),

    );
  }
}
