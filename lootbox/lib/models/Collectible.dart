import 'package:flutter/material.dart';

class Collectible {
  final String? id, image, title, description;
  final Color? color;

  Collectible({
    this.id,
    this.image,
    this.title,
    this.description,
    this.color,
  });
}

// Test Data
List<Collectible> collectibles = [
  Collectible(title: 'Mike', id: 'asset-1'),
  Collectible(title: 'David', id: 'asset-2'),
  Collectible(title: 'Authur', id: 'asset-3'),
  Collectible(title: 'Mike', id: 'asset-4'),
  Collectible(title: 'David', id: 'asset-5'),
  Collectible(title: 'Authur', id: 'asset-6'),
  Collectible(title: 'Mike', id: 'asset-7'),
  Collectible(title: 'David', id: 'asset-8'),
  Collectible(title: 'Authur', id: 'asset-9'),
];