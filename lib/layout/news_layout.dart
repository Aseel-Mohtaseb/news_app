import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var newsCubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(title: Text('News')),
            body: newsCubit.screens[newsCubit.bottomNavBarIndex],
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: newsCubit.bottomNavBarIndex,
                onTap: (index) {
                  newsCubit.changeNavBarIndex(index);
                },
                items: newsCubit.bottomNavBarItems,
            ),
          );
        },
      ),
    );
  }
}
