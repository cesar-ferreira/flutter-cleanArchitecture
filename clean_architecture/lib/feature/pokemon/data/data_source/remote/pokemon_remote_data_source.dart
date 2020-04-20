import 'dart:convert';

import 'package:cleanarchitecture/core/error/exception.dart';
import 'package:cleanarchitecture/feature/pokemon/data/model/pokemon_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

const BASE_URL = 'https://pokeapi.co/api/v2/pokemon';


abstract class PokemonRemoteDataSource {

  Future<PokemonModel> getPokemon(String number);

}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {

  final http.Client client;

  PokemonRemoteDataSourceImpl({@required this.client});

  @override
  Future<PokemonModel> getPokemon(String number) =>
      _getPokemonFromUrl(BASE_URL + '/$number');


  Future<PokemonModel> _getPokemonFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

}