import 'package:flutter/material.dart';
class cards extends StatefulWidget {
  const cards({Key? key}) : super(key: key);

  @override
  State<cards> createState() => _cardsState();
}

class _cardsState extends State<cards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),

      ),
      body: Column(
        children: [
          Text("Welcome")
        ],
      ),
    );
  }
}
