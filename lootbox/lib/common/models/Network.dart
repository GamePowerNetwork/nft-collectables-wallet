import 'package:flutter/material.dart';

class Network {
  final String? image, name, description, url;
  final Color? color;

  Network({
    this.image,
    this.name,
    this.description,
    this.url,
    this.color,
  });
}

Network selectedNetwork = Network(
  name: 'GamePower Network',
  color: Colors.purple[800],
);