import 'package:cleanarchitecture/core/dependence_injection/injection_container.dart' as dependence_injection;
import 'package:cleanarchitecture/core/error/failure.dart';
import 'package:cleanarchitecture/core/state/controller_state.dart';
import 'package:cleanarchitecture/core/state/enum_state.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/entities/pokemon.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/use_cases/get_pokemon.dart';
import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

part 'pokemon_controller.g.dart';

class PokemonController = _PokemonController with _$PokemonController;

abstract class _PokemonController with Store {

  var _getPokemonUseCase = dependence_injection.serviceLocator<GetPokemon>();

  @observable
  String number;

  @action
  changeNumber(String numberValue) => number = numberValue;

  @observable
  ObservableFuture<Either<Failure, Pokemon>> _pokemonFuture;

  @observable
  Pokemon pokemon;

  @computed
  EnumState get pokemonState => ControllerState.statusCheck(_pokemonFuture);

  @action
  Future<void> getPokemon() async {

    _pokemonFuture = ObservableFuture(_getPokemonUseCase(number: number));
    final result = await _pokemonFuture;

    if(result.isRight()) {
      pokemon = result.getOrElse(null);
    }
  }
}