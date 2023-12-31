import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/article_model.dart';
import '../../shared/components/article_list_builder.dart';
import '../../shared/components/my_separator.dart';
import '../../shared/components/news_list_item.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsCubit.get(context).getScience();

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<ArticleModel> scienceList = NewsCubit.get(context).scienceList;
        return ArticleListBuilder(list: scienceList);
      },
    );
  }
}
