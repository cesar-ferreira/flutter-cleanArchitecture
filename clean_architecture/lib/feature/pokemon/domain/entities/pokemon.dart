
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Pokemon extends Equatable {
  final String name;
  final String image;

  Pokemon({
    @required this.name,
    @required this.image,
  }) : super([name, image]);
}