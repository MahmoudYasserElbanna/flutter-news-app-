import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsTileList extends StatelessWidget {
  const NewsTileList({super.key, required this.articles});
  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    // shrinkWrap: true make the list shrinl with item size
    //   shrinkWrap: true,
    // we use NeverScrollableScrollPhysics() due to CustomScrollView
    // CustomScrollView have there scrolling physics and the NewsTileList too
    // so me must disabled scrolling here
    //   physics: const NeverScrollableScrollPhysics(),
    //   itemCount: 10,
    //   itemBuilder: (context, newsTileIndex) {
    //     return const Padding(
    //       padding: EdgeInsets.only(bottom: 22),
    //       child: NewsTile(),
    //     );
    //   },
    // );

    // Best Solution
    // ! DO NOT USE ANY METHOD INSIDE BULID METHOD !!!
    return SliverList.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int newsTileIndex) {
        return NewsTile(
          articleModel: articles[newsTileIndex],
        );
      },
    );
  }
}
