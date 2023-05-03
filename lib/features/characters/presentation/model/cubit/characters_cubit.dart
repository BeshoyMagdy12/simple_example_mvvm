
import 'package:bloc/bloc.dart';
import 'package:breaking_bad_mvvm/features/characters/data/models/character_model/character_model.dart';
import 'package:breaking_bad_mvvm/features/characters/data/repo/character_repo.dart';
import 'package:breaking_bad_mvvm/features/characters/presentation/view/widget/location_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../view/widget/episode_screen_body.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.characterRepo) : super(CharactersInitial());


  final CharacterRepo characterRepo;

  Future<List<CharacterModel>?> getAllCaracters()async{
    emit(CharactersLoding());
    
   try {
  List<CharacterModel> characters=await  characterRepo.getAllCaracters();

  emit(CharactersSuccess(characters));
  return characters;
}  catch (e) {
  emit(CharactersFailure(e.toString()));
}
   
return null;
  }

}
