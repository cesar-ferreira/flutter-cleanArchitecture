import 'dart:convert';

import 'package:cleanarchitecture/core/error/exception.dart';
import 'package:cleanarchitecture/feature/pokemon/data/model/pokemon_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

abstract class PokemonLocalDataSource {

  Future<PokemonModel> getLastPokemon();

  Future<void> cachePokemon(PokemonModel pokemonToCache);

}

const CACHED_POKEMON = 'CACHED_POKEMON';

class PokemonLocalDataSourceImpl implements PokemonLocalDataSource  {
  final SharedPreferences sharedPreferences;

  PokemonLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<PokemonModel> getLastPokemon() {
    final jsonString = sharedPreferences.getString(CACHED_POKEMON);
    if (jsonString != null) {
      return Future.value(PokemonModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cachePokemon(PokemonModel pokemonToCache) {
    return sharedPreferences.setString(CACHED_POKEMON, json.encode(pokemonToCache.toJson()),);
  }
}