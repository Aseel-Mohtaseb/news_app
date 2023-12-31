import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/search_screen/search_screen.dart';
import 'package:news_app/shared/components/components.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var newsCubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(title: Text('News'), actions: [
            IconButton(
              onPressed: () {
                navigateTo(context, SearchScreen());
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                NewsCubit.get(context).changeMode();
              },
              icon: const Icon(Icons.brightness_6),
            )
          ]),
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
    );
  }
}
