import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/widgets/news_tile_list.dart';

// TODO: Use Tradtional Way to Display and Build List from Requested API.

// class NewsTileListBuilder extends StatefulWidget {
//   const NewsTileListBuilder({super.key});

//   @override
//   State<NewsTileListBuilder> createState() => _NewsTileListBuilderState();
// }

// class _NewsTileListBuilderState extends State<NewsTileListBuilder> {
//   // any StatefulWidget Class has a initState -> initial state (before build state), DeposeStat -> Destroy widget
//   // I need to use variable to call in build method
//   bool isLoading = true;
//   List<ArticleModel> articles = [];
//   @override
//   void initState() {
//     super.initState();
//     getGeneralNews();
//   }

//   // we can't use a wait and async with initState()
//   // To solve it we maybe create a method sync and have await keyword
//   Future<void> getGeneralNews() async {
//     articles = await NewsService(dio: Dio()).getNews();
//     isLoading = false;
//     setState(() {});
//   }

//   Widget build(BuildContext context) {
//     return isLoading
//         ? const SliverToBoxAdapter(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : NewsTileList(articles: articles);
//   }
// }

// TODO: Use Professional Way to Display and Build List from Requested API.

class NewsTileListBuilder extends StatefulWidget {
  const NewsTileListBuilder({super.key, required this.apiCategory});
  final String apiCategory;
  @override
  State<NewsTileListBuilder> createState() => _NewsTileListBuilderState();
}

class _NewsTileListBuilderState extends State<NewsTileListBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(dio: Dio())
        .getTopHeadlines(apiCategory: widget.apiCategory);
  }

  @override
  Widget build(BuildContext context) {
    // * we changed FutureBuilder to <List<ArticleModel>> to avoid error message "Object" datatype.
    return FutureBuilder<List<ArticleModel>>(
      // * if we use NewsService(dio: Dio()).getNews(); that mean we can request multiple times.
      // * so we will fix it by using statfull class and initState, and tring to create connection.
      future: future,
      builder: (context, articleSnapShot) {
        if (articleSnapShot.hasData) {
          return NewsTileList(articles: articleSnapShot.data!);
        } else if (articleSnapShot.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(articleSnapShot.error.toString()),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
