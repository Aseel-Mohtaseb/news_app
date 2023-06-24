import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/business_screen/business_screen.dart';
import 'package:news_app/modules/science_screen/science_screen.dart';
import 'package:news_app/modules/settings_screen/settings_screen.dart';
import 'package:news_app/modules/tech_screen/tech_screen.dart';

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

  void changeNavBarIndex(index){
    bottomNavBarIndex = index;
    emit(NewsChangeNavBarState());
  }

  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    TechScreen(),
    SettingsScreen(),
  ];

}