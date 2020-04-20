import 'package:cleanarchitecture/feature/pokemon/domain/entities/pokemon.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/use_cases/get_pokemon.dart';
import 'package:cleanarchitecture/feature/pokemon/presentation/controller/pokemon_controller.dart';
import 'package:cleanarchitecture/feature/pokemon/presentation/widgets/pokemon_info.dart';
import 'package:flutter/material.dart';
import 'package:cleanarchitecture/core/dependence_injection/injection_container.dart' as dependence_injection;
import 'package:flutter_mobx/flutter_mobx.dart';


class PokemonPage extends StatelessWidget {

  PokemonController pokemonController = PokemonController();
  var getPokemon = dependence_injection.serviceLocator<GetPokemon>();

  final controller = TextEditingController();
  String inputString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Input a number',
                ),
                onChanged: (value) {
//                  pokemonController.setId(value);
                },
                onSubmitted: (_) {},
              ),

              SizedBox(height: 10),

              RaisedButton(
                child: Text('Search'),
                color: Theme
                    .of(context)
                    .accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: pokemonController.getPokemonUseCase,
              ),

              SizedBox(height: 32),

              Observer(
                builder: (_){
                  return PokemonInfo(name: '${pokemonController.name}' , image: '${pokemonController.image}',);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


