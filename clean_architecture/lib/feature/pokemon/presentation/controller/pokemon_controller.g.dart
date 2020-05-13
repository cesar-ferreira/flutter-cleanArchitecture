// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonController on _PokemonController, Store {
  Computed<EnumState> _$pokemonStateComputed;

  @override
  EnumState get pokemonState =>
      (_$pokemonStateComputed ??= Computed<EnumState>(() => super.pokemonState))
          .value;

  final _$numberAtom = Atom(name: '_PokemonController.number');

  @override
  String get number {
    _$numberAtom.context.enforceReadPolicy(_$numberAtom);
    _$numberAtom.reportObserved();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.context.conditionallyRunInAction(() {
      super.number = value;
      _$numberAtom.reportChanged();
    }, _$numberAtom, name: '${_$numberAtom.name}_set');
  }

  final _$_pokemonFutureAtom = Atom(name: '_PokemonController._pokemonFuture');

  @override
  ObservableFuture<Either<Failure, Pokemon>> get _pokemonFuture {
    _$_pokemonFutureAtom.context.enforceReadPolicy(_$_pokemonFutureAtom);
    _$_pokemonFutureAtom.reportObserved();
    return super._pokemonFuture;
  }

  @override
  set _pokemonFuture(ObservableFuture<Either<Failure, Pokemon>> value) {
    _$_pokemonFutureAtom.context.conditionallyRunInAction(() {
      super._pokemonFuture = value;
      _$_pokemonFutureAtom.reportChanged();
    }, _$_pokemonFutureAtom, name: '${_$_pokemonFutureAtom.name}_set');
  }

  final _$pokemonAtom = Atom(name: '_PokemonController.pokemon');

  @override
  Pokemon get pokemon {
    _$pokemonAtom.context.enforceReadPolicy(_$pokemonAtom);
    _$pokemonAtom.reportObserved();
    return super.pokemon;
  }

  @override
  set pokemon(Pokemon value) {
    _$pokemonAtom.context.conditionallyRunInAction(() {
      super.pokemon = value;
      _$pokemonAtom.reportChanged();
    }, _$pokemonAtom, name: '${_$pokemonAtom.name}_set');
  }

  final _$getPokemonAsyncAction = AsyncAction('getPokemon');

  @override
  Future<void> getPokemon() {
    return _$getPokemonAsyncAction.run(() => super.getPokemon());
  }

  final _$_PokemonControllerActionController =
      ActionController(name: '_PokemonController');

  @override
  dynamic changeNumber(String numberValue) {
    final _$actionInfo = _$_PokemonControllerActionController.startAction();
    try {
      return super.changeNumber(numberValue);
    } finally {
      _$_PokemonControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'number: ${number.toString()},pokemon: ${pokemon.toString()},pokemonState: ${pokemonState.toString()}';
    return '{$string}';
  }
}
