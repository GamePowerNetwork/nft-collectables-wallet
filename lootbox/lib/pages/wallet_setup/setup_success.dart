import 'package:flutter/material.dart';

class SetupSeccess extends StatefulWidget {
  SetupSeccess({Key? key}) : super(key: key);

  @override
  _SetupSeccessState createState() => _SetupSeccessState();
}

class _SetupSeccessState extends State<SetupSeccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [

        ],
      ),
    );
  }
}