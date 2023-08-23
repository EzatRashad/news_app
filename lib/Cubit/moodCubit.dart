import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/states.dart';
import 'package:news/network/local/cashe_helper.dart';

class MoodCubit extends Cubit<NewsStates> {
  MoodCubit() : super(NewsinitialState());

  // To use object in eny screen
  static MoodCubit get(context) => BlocProvider.of(context);

  // To Change the mood
  bool isdark = false;
  ThemeMode CTM = ThemeMode.dark;

  void changeMood({bool? fromshared}) {
    if (fromshared != null) {
      isdark = fromshared;
      emit(NewsChangeMoodStates());

    } else {
      isdark = !isdark;
      CashHelper.putData(key: 'isdark', value: isdark).then((value) {
        emit(NewsChangeMoodStates());
      });
    }
    }

}
