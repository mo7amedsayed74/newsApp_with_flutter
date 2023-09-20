import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/dio_helper.dart';
import 'package:news_app/screens/science_screen.dart';
import 'package:news_app/screens/sports_screen.dart';
import 'package:news_app/cubit/states.dart';

import '../screens/business_screen.dart';
import '../cache_helper.dart';

class NewsAppCubit extends Cubit<NewsAppStates>{
  // NewsAppCubit(super.initialState);
  NewsAppCubit() : super(InitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens= const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  void changeIndex(int index){
    currentIndex = index;
    emit(ChangeIndexState());
  }

  /// toggle mode
  bool isDark = true;
  void changeMode({bool? lastMode}){
    if(lastMode!=null){
      isDark = lastMode;
      emit(ChangeModeState());
    }else{
      isDark = !isDark;
      CacheHelper.setBooleanAppMode(key: 'isDark', isDark: isDark).then((value) {
        emit(ChangeModeState());
      });
    }
  }

  /// get data (Dio)
  // my apiKey : https://newsapi.org/v2/top-headlines?apiKey=2c13eed31aa84ce38b5f01c2ddf398f0&country=us&category=business
  // https://newsapi.org/v2/top-headlines?apiKey=66b5a55516a24d118a228a1ab414f169&country=us&category=business


  List<dynamic>businessArticles=[];
  void getBusinessArticles() {
    emit(LoadingState());
    DioHelper.getData(
      urlMethod: 'v2/top-headlines',
      query: {
        'apiKey':'66b5a55516a24d118a228a1ab414f169',
        'country':'us',
        'category':'business',
      },
    ).then((value) {
      businessArticles = value.data['articles'];
      emit(GetBusinessArticlesSuccessfulState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetBusinessArticlesErrorState(error.toString()));
    });
  }


  List<dynamic>sportsArticles=[];
  void getSportsArticles() {
    emit(LoadingState());
    DioHelper.getData(
      urlMethod: 'v2/top-headlines',
      query: {
        'apiKey':'66b5a55516a24d118a228a1ab414f169',
        'country':'us',
        'category':'sports',
      },
    ).then((value) {
      sportsArticles = value.data['articles'];
      emit(GetSportsArticlesSuccessfulState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetSportsArticlesErrorState(error.toString()));
    });
  }


  List<dynamic>scienceArticles=[];
  void getScienceArticles() {
    emit(LoadingState());
    DioHelper.getData(
      urlMethod: 'v2/top-headlines',
      query: {
        'apiKey':'66b5a55516a24d118a228a1ab414f169',
        'country':'us',
        'category':'science',
      },
    ).then((value) {
      scienceArticles = value.data['articles'];
      emit(GetScienceArticlesSuccessfulState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetScienceArticlesErrorState(error.toString()));
    });
  }


  List<dynamic> searchArticles = [];
  void getSearchArticles(String value) {
    emit(LoadingState());
    DioHelper.getData(
      urlMethod: 'v2/everything',
      query: {
        'apiKey':'66b5a55516a24d118a228a1ab414f169',
        'q': value,
      },
    ).then((value) {
      searchArticles = value.data['articles'];
      emit(GetSearchArticlesSuccessfulState());
    }).catchError((error){
      debugPrint(error.toString());
      emit(GetSearchArticlesErrorState(error.toString()));
    });
  }


}