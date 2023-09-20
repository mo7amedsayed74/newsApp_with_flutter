import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cache_helper.dart';
import 'dio_helper.dart';
import 'cubit/states.dart';
import 'cubit/bloc_observer.dart';
import 'layout/news_layout.dart';
import 'cubit/cubit.dart';
import 'themes.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized(); // بحط الميثود دي عشان اضمن ان كل الفانكشنز اللي في ال main دي هتتنفذ وبعدين ينفذ runApp

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? lastMode = CacheHelper.getBooleanAppMode(key: 'isDark');

  runApp(MyApp(lastMode: lastMode,));
}

class MyApp extends StatelessWidget {
  final bool? lastMode;
  const MyApp({super.key,this.lastMode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsAppCubit()..getBusinessArticles()..getSportsArticles()..getScienceArticles()..changeMode(lastMode: lastMode),
        child: BlocConsumer<NewsAppCubit, NewsAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme, // into 'themes.dart'
              darkTheme: darkTheme, // into 'themes.dart'
              themeMode: NewsAppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
              home: const NewsLayout(),
            );
          },
        )
    );
  }
}



