import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business_screen/business_screen.dart';
import 'package:news_app/modules/science_screen/science_screen.dart';
import 'package:news_app/modules/settings_screen/settings_screen.dart';
import 'package:news_app/modules/tech_screen/tech_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int bottomNavBarIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(label: 'Business', icon: Icon(Icons.business)),
    BottomNavigationBarItem(label: 'Science', icon: Icon(Icons.science)),
    BottomNavigationBarItem(label: 'Technology', icon: Icon(Icons.computer)),
    BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    TechScreen(),
    SettingsScreen(),
  ];

  void changeNavBarIndex(index){
    bottomNavBarIndex = index;
    emit(NewsChangeNavBarState());
  }


  List businessList = [];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: '/v2/top-headlines', query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '485691edba1548158fa3070d0566c01f'
    }).then((value) {
      emit(NewsGetBusinessSuccessState());
      businessList = value.data;
      print(value.data.toString());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState());
      print(error.toString());
    });
  }



}