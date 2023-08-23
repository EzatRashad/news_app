import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news/Cubit/states.dart';
import '../Modules/Business/business_Screen.dart';
import '../Modules/Science/science_Screen.dart';
import '../Modules/Sports/sports_Screen.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsinitialState());

  // To use object in eny screen
  static NewsCubit get(context) => BlocProvider.of(context);

  // To manage Navbar Screens
  int currentIndex = 0;
  List screens = [
    const ScienceScreen(),
    const SportsScreen(),
    const BusinessScreen(),
  ];
  List<GButton> items = [
    const GButton(
      icon: Icons.science,
      text: "Science",
    ),
    const GButton(
      icon: Icons.sports,
      text: "Sports",
    ),
    const GButton(
      icon: Icons.business_center,
      text: "Business",
    ),
  ];

  void changeNav(int index) {
    currentIndex = index;

    emit(NewsNavChangeStates());
  }

  //----------------------------------------------------------------------------

  // To get data from API

  // Business
  List<dynamic> business = [];
  void GetBData() {
    emit(NewsBusinessLoadingStates());
    DioHelper.getData(

      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      },

    ).then((value) {

      print("total Business Results = ${value.data["totalResults"]}");
      business = value.data["articles"];
      print(business);
      emit(NewsBusinessGetSuccessDataStates());

    }).catchError((error) {

      print("Error is : $error");
      emit(NewsBusinessGetErrorDataStates(error.toString()));

    });
  }

  // sports
  List<dynamic> sports = [];
  void GetSports() {
    emit(NewsSportLoadingStates());
    DioHelper.getData(

      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      },

    ).then((value) {

      print("total sports Results = ${value.data["totalResults"]}");
      sports = value.data["articles"];
      print(sports);
      emit(NewsSportGetSuccessDataStates());

    }).catchError((error) {

      print("Error is : $error");
      emit(NewsSportGetErrorDataStates(error.toString()));

    });
  }

  // Science
  List<dynamic> Sciences = [];
  void GetSciences() {
    emit(NewsScienceLoadingStates());
    DioHelper.getData(

      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'Science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      },

    ).then((value) {

      print("total Science Results = ${value.data["totalResults"]}");
      Sciences = value.data["articles"];
      print(Sciences);
      emit(NewsScienceGetSuccessDataStates());

    }).catchError((error) {

      print("Error is : $error");
      emit(NewsScienceGetErrorDataStates(error.toString()));

    });
  }

  //----------------------------------------------------------------------------

  // To control time of LiquidPullToRefresh
  Future<void> Ref() async {
    return await Future.delayed(const Duration(seconds: 2));
  }
//------------------------------------------------------------------------------


  // Search
  List<dynamic> search = [];
  void getsearch( String value) {
    emit(NewsSearchLoadingStates());
    search=[];
    DioHelper.getData(

      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      },

    ).then((value) {

      search = value.data["articles"];
      print(search);
      emit(NewsSearchGetSuccessDataStates());

    }).catchError((error) {

      print("Error is : $error");
      emit(NewsSearchGetErrorDataStates(error.toString()));

    });
  }



}
