import 'package:ai_recipe/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/app_colors_const.dart';
import 'constants/app_styles_const.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();

  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //       statusBarColor: AppColors.white,
  //       statusBarIconBrightness: Brightness.dark),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Generated Recipes',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ru', 'RU'),
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          appBarTheme: const AppBarTheme(
              centerTitle: false,
              elevation: 0,
              backgroundColor: AppColors.white,
              toolbarTextStyle: AppStyles.s14w400,
              titleTextStyle: AppStyles.s16w500,
              iconTheme: IconThemeData(color: AppColors.dark)),
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          fontFamily: 'Nunito',
          iconTheme: const IconThemeData(color: AppColors.dark)),
      home: const Home(),
    );
  }
}
