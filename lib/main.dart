import 'package:breaking_bad_mvvm/core/utilities/app_routes.dart';
import 'package:breaking_bad_mvvm/core/utilities/app_services.dart';
import 'package:breaking_bad_mvvm/core/utilities/bloc_observer.dart';
import 'package:breaking_bad_mvvm/features/characters/data/repo/Character_repo_impl.dart';
import 'package:breaking_bad_mvvm/features/characters/presentation/model/cubit/characters_cubit.dart';
import 'package:breaking_bad_mvvm/features/characters/presentation/view/widget/charactersscreenbody.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    appRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;

  const MyApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CharactersCubit(CharacterRepoImpl(ApiService(Dio())))
                      ..getAllCaracters(),
                child:const CharactersScreenBody(),
              ),
            ],
            child: MaterialApp(
              theme: ThemeData(
                useMaterial3: true,
                scaffoldBackgroundColor:const Color(0xffEEEEEE),
                
                colorSchemeSeed:const Color(0xFFFF597B)
              ),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRoute.generateRoute,
            ));
      },
    );
  }
}
