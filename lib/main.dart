import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_app/Screens/splash.dart';
import 'package:quran_app/cubit/getQurancubit/getQuranState.dart';
import 'package:quran_app/cubit/getQurancubit/getSearchCubit.dart';
import 'package:quran_app/cubit/getQurancubit/getqurajuzCubit.dart';
import 'package:quran_app/cubit/getQurancubit/getquranCubit.dart';

void main() {
  runApp(QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetQuranCubit()..getsoura(),
        ),
        BlocProvider(
          create: (context) => GetQuranJuzCubit(),
        ),
        BlocProvider(
          create: (context) => GetSearchCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: SplashView(),

        // theme: ThemeData(textTheme: ),
      ),
    );
  }
}
