// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/characters_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/Data/Repository/character_Repository.dart';
import 'package:flutter_application_1/Data/web%20services/character_web_services.dart';
import 'package:flutter_application_1/constants/strings.dart';
import 'package:flutter_application_1/cubit/character_cubit.dart';

class AppRouter {
  late characterRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = characterRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: const characterscreen(),
          ),
        );

    }
  return null;
  }
}
