import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/article_model.dart';
import '../../shared/components/article_list_builder.dart';
import '../../shared/components/my_separator.dart';
import '../../shared/components/news_list_item.dart';

class TechScreen extends StatelessWidget {
  const TechScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit.get(context).getTech();

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<ArticleModel> techList = NewsCubit.get(context).techList;
        return ArticleListBuilder(list: techList);
      },
    );
  }
}
