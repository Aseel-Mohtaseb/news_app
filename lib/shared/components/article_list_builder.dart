import 'package:flutter/material.dart';

import 'my_separator.dart';
import 'news_list_item.dart';

class ArticleListBuilder extends StatelessWidget {
  List list = [];
  ArticleListBuilder({required this.list});

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? Center(
      child: CircularProgressIndicator(),
    )
        : ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            NewsListItem(articleModel: list[index]),
        separatorBuilder: (context, index) => MySeparator(),
        itemCount: list.length);
  }
}
