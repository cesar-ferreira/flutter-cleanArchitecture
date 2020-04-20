import 'package:cleanarchitecture/core/error/failure.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/entities/pokemon.dart';
import 'package:dartz/dartz.dart';

abstract class PokemonRepository {

  Future<Either<Failure, Pokemon>> getPokemon(int number);

}