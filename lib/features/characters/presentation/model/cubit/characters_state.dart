part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
class CharactersSuccess extends CharactersState{
  final List<CharacterModel> characters;

  CharactersSuccess(this.characters);
}

class CharactersFailure extends CharactersState{
  final String errMassge;

  CharactersFailure(this.errMassge);
}

class CharactersLoding extends CharactersState{}

class CharactersBottomNavaState extends CharactersState{}