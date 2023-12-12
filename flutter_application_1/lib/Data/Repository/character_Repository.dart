import 'package:flutter_application_1/Data/web%20services/character_web_services.dart';
import '../Models/characters.dart';

class characterRepository {
  late CharactersWebServices characterwebservice;
  characterRepository(this.characterwebservice);

  Future<List<Character>> getAllCharacters() async {
    final charactersRepo = await characterwebservice.getAllCharacters();
    // ignore: non_constant_identifier_names
    return charactersRepo
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
