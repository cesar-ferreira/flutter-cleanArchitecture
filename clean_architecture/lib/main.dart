import 'package:cleanarchitecture/feature/pokemon/presentation/page/pokemon_page.dart';
import 'package:flutter/material.dart';

import 'package:cleanarchitecture/core/dependence_injection/injection_container.dart' as dependence_injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependence_injection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonPage(),
    );
  }
}
