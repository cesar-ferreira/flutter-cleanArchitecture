import 'package:cleanarchitecture/feature/pokemon/data/data_source/local/pokemon_local_data_source.dart';
import 'package:cleanarchitecture/feature/pokemon/data/data_source/remote/pokemon_remote_data_source.dart';
import 'package:cleanarchitecture/feature/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/use_cases/get_pokemon.dart';
import 'package:cleanarchitecture/feature/pokemon/presentation/controller/pokemon_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia

  // Controller
  serviceLocator.registerLazySingleton(() => PokemonController());

  // Use cases
  serviceLocator.registerLazySingleton(() => GetPokemon(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<PokemonRepository>(
        () => PokemonRepositoryImpl(
      localDataSource: serviceLocator(),
      remoteDataSource: serviceLocator(),
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<PokemonRemoteDataSource>(
        () => PokemonRemoteDataSourceImpl(client: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<PokemonLocalDataSource>(
        () => PokemonLocalDataSourceImpl(sharedPreferences: serviceLocator()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
}