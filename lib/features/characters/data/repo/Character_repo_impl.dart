import 'package:breaking_bad_mvvm/core/utilities/app_services.dart';
import 'package:breaking_bad_mvvm/features/characters/data/models/character_model/character_model.dart';
import 'package:breaking_bad_mvvm/features/characters/data/repo/character_repo.dart';

class CharacterRepoImpl extends CharacterRepo {
  final ApiService apiService;

  CharacterRepoImpl(this.apiService);
  @override
  Future<List<CharacterModel>> getAllCaracters() async {
    List<CharacterModel> characters = [];
    try {
      Map<String, dynamic> data = await apiService.get(endPoint: 'character');

      for (var character in data['results']) {
        characters.add(CharacterModel.fromJson(character));
      }
    } catch (e) {
      print(e.toString());
    }
    print(characters.length);
    return characters;
  }
}
