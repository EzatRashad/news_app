import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Component/new_Widget.dart';
import 'package:news/Cubit/cubit.dart';
import 'package:news/Cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder:(context,state){

          var list = NewsCubit.get(context).search;

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      NewsCubit.get(context).getsearch(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'is empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text("Search",style: TextStyle(color: Colors.deepPurple),),
                      prefixIcon: Icon(Icons.search,color:Colors.deepPurple ,),
                      focusColor: Colors.grey,
                      filled: true,
                      fillColor: Colors.grey,
                    ),
                  ),
                ),
                Expanded(child: ABuilder(list, context,isSearch: true)),
              ],
            ),
          );
        },
    );
  }
}
