import 'package:breaking_bad_mvvm/core/utilities/app_services.dart';
import 'package:breaking_bad_mvvm/features/characters/data/repo/Character_repo_impl.dart';
import 'package:breaking_bad_mvvm/features/characters/presentation/model/cubit/characters_cubit.dart';
import 'package:breaking_bad_mvvm/features/characters/presentation/view/widget/charactersscreenbody.dart';
import 'package:breaking_bad_mvvm/features/home/presentation/view/home_screen.dart';
import 'package:breaking_bad_mvvm/features/login/presentation/view/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  late CharacterRepoImpl characterRepoImpl;
  late CharactersCubit charactersCubit;

  Route? generateRoute(RouteSettings settings) {
    characterRepoImpl = CharacterRepoImpl(
      ApiService(
        Dio(),
      ),
    );
    charactersCubit = CharactersCubit(characterRepoImpl)..getAllCaracters();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const LogInScreen(),
        );
      case 'homescreen':
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      case '/CharactersScreenBody':
        return MaterialPageRoute(
          builder: (_) => const CharactersScreenBody(),
        );
    }
  }
}
