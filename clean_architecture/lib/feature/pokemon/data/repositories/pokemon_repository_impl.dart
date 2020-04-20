import 'package:cleanarchitecture/core/error/failure.dart';
import 'package:cleanarchitecture/core/error/exception.dart';
import 'package:cleanarchitecture/feature/pokemon/data/data_source/local/pokemon_local_data_source.dart';
import 'package:cleanarchitecture/feature/pokemon/data/data_source/remote/pokemon_remote_data_source.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/entities/pokemon.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';


class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;

  PokemonRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
  });

  @override
  Future<Either<Failure, Pokemon>> getPokemon(String number) async {
    return await _getPokemon(() {
      return remoteDataSource.getPokemon(number);
    });
  }


  Future<Either<Failure, Pokemon>> _getPokemon(
      Future<Pokemon> Function() getPokemonOr,
      ) async {

    try {
      final remotePokemon = await getPokemonOr();
      localDataSource.cachePokemon(remotePokemon);
      return Right(remotePokemon);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}