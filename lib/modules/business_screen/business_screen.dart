import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';

import '../../models/article_model.dart';
import '../../shared/components/my_separator.dart';
import '../../shared/components/news_list_item.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {

        List<ArticleModel> businessList = NewsCubit.get(context).businessList;

        return businessList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
            itemBuilder: (context, index) => NewsListItem(articleModel: businessList[index]),
            separatorBuilder: (context, index ) => MySeparator(),
            itemCount: businessList.length
        );
      },
    );
  }
}
