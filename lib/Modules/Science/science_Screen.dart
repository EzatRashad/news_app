import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../Component/new_Widget.dart';
import '../../Cubit/cubit.dart';
import '../../Cubit/states.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return BlocConsumer<NewsCubit,NewsStates>(
          listener:(context,state){} ,
          builder:(context,state){
            var cubit = NewsCubit.get(context);
            var list =cubit.Sciences;

            return ABuilder(list,context);
          } ,
        ) ;

  }
}
