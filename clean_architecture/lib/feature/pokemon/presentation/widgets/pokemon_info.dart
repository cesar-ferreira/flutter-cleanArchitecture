

import 'package:flutter/material.dart';

class PokemonInfo extends StatelessWidget {

  final String name;
  final String image;

  const PokemonInfo({this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        Image.network(image),
      ],
    );
  }
}