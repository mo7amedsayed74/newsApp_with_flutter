import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SearchScreen extends StatelessWidget {

  TextEditingController? searchController;

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state){
        List<dynamic> articles = NewsAppCubit.get(context).searchArticles;
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  onChanged: (String value){
                    debugPrint(value);
                    NewsAppCubit.get(context).getSearchArticles(value);
                  },

                  decoration: InputDecoration(
                    //contentPadding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    label: const Text(
                      'Search',
                    ),
                  ),

                ),
              ),
              Expanded(child: articleBuilder(list: articles,isSearchScreen: true)),
            ],
          ),
        );
      },
    );
  }
}
