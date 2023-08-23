import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news/Cubit/cubit.dart';
import 'package:news/Cubit/moodCubit.dart';
import 'package:news/Cubit/states.dart';
import 'package:news/search_module/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color b = Colors.black;
  Color w = Colors.white;
  Color g = Colors.grey.shade800;
  Color P = Colors.deepPurple;
  Color p = const Color(0xFF9575CD);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, states) {},
        builder: (context, states) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
/*
            floatingActionButton: FloatingActionButton(onPressed: () {

              DioHelper.getData(
                url: 'v2/top-headlines',
                query:{
                  'country':'eg',
                  'category':'business',
                  'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
                } ,
              ).then((value) {
                print(value.data.toString());
              });
            },),
*/
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  color: P,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: GNav(
                  backgroundColor: P,
                  color: w,
                  activeColor: b,
                  tabBackgroundColor: p,
                  gap: 15,
                  padding: const EdgeInsets.all(16),
                  iconSize: 25,
                  // SelectionOverlay.fadeDuration,
                  //rippleColor: b,
                  //hoverColor: Colors.redAccent,
                  curve: Curves.easeInCubic,
                  duration: const Duration(milliseconds: 400),
                  onTabChange: (index) {
                    cubit.changeNav(index);
                  },
                  tabs: cubit.items,
                ),
              ),
            ),
            appBar: AppBar(
              title: const Text("News App"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => SearchScreen(),));

                  },
                    icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {

                    MoodCubit.get(context).changeMood();
                  },
                  icon: const Icon(Icons.brightness_4_outlined),
                ),

              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      );
  }
}
