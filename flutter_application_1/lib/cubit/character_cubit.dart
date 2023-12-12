import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/Data/Models/characters.dart';
import 'package:flutter_application_1/Data/Repository/character_Repository.dart';

part 'character_state.dart';

class CharactersCubit extends Cubit<CharacterState> {
  final characterRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharacterInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
