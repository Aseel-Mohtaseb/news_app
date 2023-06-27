import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business_screen/business_screen.dart';
import 'package:news_app/modules/science_screen/science_screen.dart';
import 'package:news_app/modules/tech_screen/tech_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import '../../models/article_model.dart';
import '../../shared/network/local/cache_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int bottomNavBarIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(label: 'Business', icon: Icon(Icons.business)),
    BottomNavigationBarItem(label: 'Science', icon: Icon(Icons.science)),
    BottomNavigationBarItem(label: 'Technology', icon: Icon(Icons.computer)),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    TechScreen(),
  ];

  void changeNavBarIndex(index){
    bottomNavBarIndex = index;
    emit(NewsChangeNavBarState());
  }

  bool isLight = CacheHelper.getBool(key: 'isLight');

  void changeMode(){
    isLight = !isLight;
    CacheHelper.setBool(key: "isLight", value: isLight).then((value) {
      emit(NewsChangeModeState());
    });
  }


  List<ArticleModel> businessList = [];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: '/v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '485691edba1548158fa3070d0566c01f'
    }).then((value) {
      emit(NewsGetBusinessSuccessState());
      businessList = List<ArticleModel>.from(value.data['articles'].map((article)=>ArticleModel.fromMap(article)));
      print(value.data.toString());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState());
      print(error.toString());
    });
  }

  List<ArticleModel> scienceList = [];

  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: '/v2/top-headlines', query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '485691edba1548158fa3070d0566c01f'
    }).then((value) {
      emit(NewsGetScienceSuccessState());
      scienceList = List<ArticleModel>.from(value.data['articles'].map((article)=>ArticleModel.fromMap(article)));
      print(value.data.toString());
    }).catchError((error) {
      emit(NewsGetScienceErrorState());
      print(error.toString());
    });
  }

  List<ArticleModel> techList = [];

  void getTech(){
    emit(NewsGetTechLoadingState());
    DioHelper.getData(url: '/v2/top-headlines', query: {
      'country': 'us',
      'category': 'technology',
      'apiKey': '485691edba1548158fa3070d0566c01f'
    }).then((value) {
      emit(NewsGetTechSuccessState());
      techList = List<ArticleModel>.from(value.data['articles'].map((article)=>ArticleModel.fromMap(article)));
      print(value.data.toString());
    }).catchError((error) {
      emit(NewsGetTechErrorState());
      print(error.toString());
    });
  }




}