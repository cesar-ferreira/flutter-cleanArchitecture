import 'package:cleanarchitecture/feature/pokemon/domain/entities/pokemon.dart';
import 'package:meta/meta.dart';

class PokemonModel extends Pokemon {

  PokemonModel({@required String name, @required String image,}) : super(
    name: name,
    image: image,
  );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['name'],
      image: json['sprites']['front_default'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}