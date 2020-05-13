import 'package:cleanarchitecture/core/state/enum_state.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/entities/pokemon.dart';
import 'package:cleanarchitecture/feature/pokemon/domain/use_cases/get_pokemon.dart';
import 'package:cleanarchitecture/feature/pokemon/presentation/controller/pokemon_controller.dart';
import 'package:cleanarchitecture/feature/pokemon/presentation/widgets/loading_widget.dart';
import 'package:cleanarchitecture/feature/pokemon/presentation/widgets/pokemon_info.dart';
import 'package:flutter/material.dart';
import 'package:cleanarchitecture/core/dependence_injection/injection_container.dart' as dependence_injection;
import 'package:flutter_mobx/flutter_mobx.dart';

class PokemonPage extends StatefulWidget {
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  var pokemonController = dependence_injection.serviceLocator<PokemonController>();

  final controller = TextEditingController();
  String inputString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
//        child: Observer(builder: (_) {
//          switch (pokemonController.pokemonState) {
//            case EnumState.loading:
//              return LoadingWidget();
//            case EnumState.loaded:
//              return Text(pokemonController.pokemon.name);
//            case EnumState.error:
//              return Text('Error');
//            default:
//              return Text('Default');
//          }
//        }),


//
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                child: Observer(builder: (_) {
                  switch (pokemonController.pokemonState) {
                    case EnumState.loading:
                      return LoadingWidget();
                    case EnumState.loaded:
                      return PokemonInfo(name: '${pokemonController.pokemon.name}' , image: '${pokemonController.pokemon.image}',);
                      case EnumState.error:
                      return Text('Error');
                    default:
                      return LoadingWidget();
                  }
                }),
              ),

              SizedBox(height: 32,),

              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Input a number',
                ),
                onChanged: (value) {
                  pokemonController.changeNumber(value);
                },
                onSubmitted: (_) {},
              ),

              SizedBox(height: 10),

              RaisedButton (
                child: Text('Search'),
                color: Theme
                    .of(context)
                    .accentColor,
                textTheme: ButtonTextTheme.primary,
                onPressed: () => pokemonController.getPokemon(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

