import 'package:breaking_bad_mvvm/features/characters/data/models/character_model/character_model.dart';

abstract class CharacterRepo{
  Future<List<CharacterModel>> getAllCaracters();

}