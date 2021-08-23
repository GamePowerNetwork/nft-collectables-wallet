import 'package:flare_flutter/flare_actor.dart';
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
          FlareActor("assets/animations/login_screen_animation_top.flr",
              alignment: Alignment.topCenter,
              fit: BoxFit.contain,
              color: Color(0x77000000),
              animation: "Flow"),
        ],
      ),
    );
  }
}