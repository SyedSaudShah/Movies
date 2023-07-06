
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/Api/fetchapi.dart';
import 'package:movies/ModelClass/mModel.dart';

@immutable
abstract class PostState {}

@immutable
class PostInitialState extends PostState {}

@immutable
class PostLoadingState extends PostState {}

@immutable
class PostLoadedState extends PostState {
  final List<GetMoviesModel> list;
  PostLoadedState({
    required this.list,
  });
}

class PostErrorState extends PostState {
  final String message;
  PostErrorState({
    required this.message,
  });
}
class ApiStateNotifier extends StateNotifier<PostState>{
  ApiStateNotifier():super(PostLoadingState()){
    fetchDatas();
  }
  FetchApi fetchApi = FetchApi();
  dynamic fetchDatas() async {
    try{
      var listDAta = await fetchApi.fetchPost();
      state = PostLoadedState(list:  listDAta);
    }catch (e){
      state = PostErrorState(message: e.toString());
    }
  }
}
