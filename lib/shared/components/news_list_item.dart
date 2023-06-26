import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/article_model.dart';

class NewsListItem extends StatelessWidget {
  late ArticleModel articleModel;

  NewsListItem({required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            height: 110,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(articleModel.urlToImage != ''
                    ? articleModel.urlToImage
                    : 'https://www.moroylab.org/wp-content/uploads/2018/05/news-2444778_640.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${articleModel.title}',
                    style: Theme.of(context).textTheme.bodyText1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${articleModel.publishedAt}',
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
