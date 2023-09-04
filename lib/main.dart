import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iti_23_g2/ecommerce/helper/dio_helper.dart';
import 'package:iti_23_g2/ecommerce/home/cubit/home_cubit.dart';
import 'package:iti_23_g2/ecommerce/login/login_screen.dart';
import 'package:iti_23_g2/ecommerce/main/main_screen.dart';
import 'package:iti_23_g2/ecommerce/sign_up/cubit/sign_up_cubit.dart';
import 'package:iti_23_g2/ecommerce/splash/splash_screen.dart';
import 'package:iti_23_g2/language_cubit/language_cubit.dart';
import 'package:iti_23_g2/note_app/hive_helper.dart';
import 'package:iti_23_g2/posts/cubit/posts_cubit.dart';

import 'bloc_observer.dart';
import 'ecommerce/login/cubit/login_cubit.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(HiveHelper.notesBox);
  await Hive.openBox(HiveHelper.myToken);
  Bloc.observer = AppBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

/// Widget Life Cycle
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostsCubit()..getPosts(),
        ),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
        BlocProvider(create: (context) => HomeCubit()..getBanners()),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            locale: context.read<LanguageCubit>().locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: HiveHelper.getToken() == "" ? SplashScreen() : MainScreen(),
          );
        },
      ),
    );
  }
}
