import 'package:cleanarchitecture/core/dependence_injection/injection_container.dart' as dependence_injection;
import 'package:cleanarchitecture/feature/pokemon/domain/use_cases/get_pokemon.dart';
import 'package:mobx/mobx.dart';


class PokemonController {

  var getPokemonUseCase = dependence_injection.serviceLocator<GetPokemon>();

  PokemonController() {
    getPokemon = Action(_getPokemon);
    setId = Action(_setId);
    setName = Action(_setName);
    setImage = Action(_setImage);

//    isValid = Computed(bool _isValid);
  }

  Observable _id = Observable("");
  Observable _name = Observable("");
  Observable _image = Observable("");

  String get id => _id.value;
  String get name => _name.value;
  String get image => _image.value;

  Action getPokemon;
  Action setId;
  Action setName;
  Action setImage;

  void _setId(String value) => _id.value = value;
  void _setName(String value) => _name.value = value;
  void _setImage(String value) => _image.value = value;

//
//  Computed isValid;
//
//  bool get _isValid => (_id.value > 0 && _id.value < 805);



  Future<void> _getPokemon() async {
    final pokemon = await getPokemonUseCase(number: _id.value);
    print(pokemon);
  }



}