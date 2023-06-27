import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search_screen/cubit/states.dart';

import '../../../models/article_model.dart';
import '../../../shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit() : super(SearchInitState());

  static SearchCubit get(context) => BlocProvider.of(context);


  List searchList = [];

  void getSearchArticles({ required String searchText}){
    emit(SearchLoadingState());
    DioHelper.getData(url: '/v2/everything', query: {
      'q': searchText,
      'apiKey': '485691edba1548158fa3070d0566c01f'
    }).then((value) {
      emit(SearchSuccessState());
      searchList = List<ArticleModel>.from(value.data['articles']
          .map((article) => ArticleModel.fromMap(article)));
      print(value.data.toString());
    }).catchError((error) {
      emit(SearchErrorState());
      print(error.toString());
    });
  }


}