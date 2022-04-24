// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final currYear = DateTime.now().year;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _increment() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 001) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  Future<void> _decrement() async {
    final SharedPreferences prefs = await _prefs;
    int? counter = prefs.getInt('counter');

    if (counter! > 1) {
      counter--;
    }

    setState(() {
      _counter = prefs.setInt('counter', counter!).then((bool success) {
        return counter!;
      });
    });
  }

  Future<void> setToZero() async {
    final prefManager = await SharedPreferences.getInstance();
    await prefManager.clear();
    const int counter = 001;
    setState(() {
      _counter = prefManager.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<int>(
                future: _counter,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    default:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Text(
                            "$currYear/ABH/DCN/${snapshot.data.toString().padLeft(4, "0")}");
                      }
                  }
                }),
            ElevatedButton(
                onPressed: _increment, child: const Text("Generate Invoice")),
            ElevatedButton(
                onPressed: _decrement, child: const Text("Remove Invoice")),
            ElevatedButton(
                onPressed: setToZero, child: const Text("Remove All"))
          ],
        ),
      ),
    );
  }
}


//  Text("$currYear/ABH/DCN/$currCount"),
// void main(List<String> args) {
//   final now = DateTime.now().year;
//   var count = 1;

//   print('${now}/ABH/DCN/${count}');
//   _increment(count);
// }

// _increment(int count) {
//   return count++;
// }