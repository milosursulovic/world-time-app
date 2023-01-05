import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map _data = {};

  @override
  Widget build(BuildContext context) {
    _data = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
        as Map;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/location");
              },
              icon: const Icon(Icons.edit_location),
              label: const Text("Edit Location"),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _data["location"],
                  style: const TextStyle(fontSize: 28.0, letterSpacing: 2.0),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              _data["time"],
              style: const TextStyle(fontSize: 66.0),
            )
          ],
        ),
      )),
    );
  }
}
