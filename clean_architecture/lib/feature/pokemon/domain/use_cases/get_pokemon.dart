import 'package:cleanarchitecture/core/error/failure.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/entities/pokemon.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class GetPokemon {

  final PokemonRepository repository;

  GetPokemon(this.repository);

  Future<Either<Failure, Pokemon>> call({@required int number}) async {
    return await repository.getPokemon(number);
  }

}