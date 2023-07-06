import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/Provider/NotiProvider.dart';
import 'package:movies/Provider/state_Provider.dart';

import '../ModelClass/mModel.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(getNotifierProvider);
    return Scaffold(
      body: Builder(builder: (context) {
        if (postState is PostLoadingState) {
          return  const LoadingStateWidget();
        }  else if (postState is PostLoadedState) {
          return LoadedStateWidget(listOfPost: postState.list);
        } else {
          return ErrorStateWidget(
              errorMessage: (postState as PostErrorState).message);
        }
      },),
    ) ;
  }
}

class LoadingStateWidget extends ConsumerWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.amber,
      ),
    );
  }
}

class LoadedStateWidget extends ConsumerWidget {
  const LoadedStateWidget({super.key, required this.listOfPost});

  final List<GetMoviesModel> listOfPost;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ListView.builder(
      itemCount: listOfPost.length,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height*0.2,
          child: Column(
              children: [
                Text(listOfPost[index].id.toString()),
                const Spacer(),
                Text(listOfPost[index].movie.toString()),
                // const Spacer(),
                Image.network('https://www.imdb.com/${listOfPost[index].image.toString()}'),
                // const Spacer(),
                Text(listOfPost[index].imdbUrl.toString()),
                // const Spacer(),
                Text(listOfPost[index].rating.toString()),
              ],


            ),
        );
      },
    );
  }
}

class ErrorStateWidget extends ConsumerWidget {
  const ErrorStateWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        color: Colors.red,
        child: Text(errorMessage),
      ),
    );
  }
}
