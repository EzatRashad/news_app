import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/Cubit/cubit.dart';
import 'package:news/Cubit/moodCubit.dart';
import 'package:news/Cubit/states.dart';
import 'package:news/network/local/cashe_helper.dart';
import 'package:news/network/remote/dio_helper.dart';

import 'Cubit/BlocObserver.dart';
import 'home_Page.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CashHelper.init();
  bool? isdark = CashHelper.getData(key: 'isdark');
  runApp( MyApp(isdark));
}

class MyApp extends StatelessWidget {

  final bool? isdark;
   MyApp(this.isdark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) => NewsCubit()..GetBData()..GetSciences()..GetSports(), ),
        BlocProvider(create: (BuildContext context) => MoodCubit()..changeMood(fromshared: isdark),)

      ],
      child: BlocConsumer<MoodCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(

              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.deepPurple,
              ),
              primarySwatch: Colors.deepPurple,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.deepPurple,
                elevation: 0,
                titleTextStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                iconTheme: IconThemeData(size: 35, color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepPurple,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.black,
                elevation: 0,
                titleTextStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                iconTheme: const IconThemeData(size: 35, color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              dividerColor: Colors.white,
            ),
            themeMode: MoodCubit.get(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
