import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:upstanders/global/theme/colors.dart';
import 'package:upstanders/home/bloc/home_bloc.dart';
import 'package:upstanders/login/view/login_screen.dart';
import 'package:upstanders/splash/view/view.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: MyTheme.primaryColor));
  runApp(MyApp());
  // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

final theme = ThemeData(
  textTheme: GoogleFonts.karlaTextTheme(),
  primaryColor: MyTheme.primaryColor,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upstanders',
      theme: theme,
      home:
      //MapDemo(),
      //  FacePage(),
      LoginScreen(),
      //VideoList(),
      //StartQuizScreen()
      // BeginQuizScreen()
      // MyHomePage(),
      // NormalPlayerPage()
      // BackLoc()
      // BackFetch()
      // MyScaffoldBody(),

      localeListResolutionCallback: (locales, supportedLocales) {
        print('device locales=$locales supported locales=$supportedLocales');

        for (Locale locale in locales) {
          // if device language is supported by the app,
          // just return it to set it as current app language
          if (supportedLocales.contains(locale)) {
            return locale;
          }
        }

        // if device language is not supported by the app,
        // the app will set it to english but return this to set to Bahasa instead
        return Locale('en', 'US');
        // Locale('id', 'ID');
      },

      supportedLocales: [
        Locale('en', 'US'),
      ],
      //  [Locale('id', 'ID'), Locale('en', 'US')],
      locale: Locale('en', 'US'),
    );
  }
}


