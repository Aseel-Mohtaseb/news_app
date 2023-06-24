import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'layout/news_layout.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: const NewsLayout(),
    );
  }
}
