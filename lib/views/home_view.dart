import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_card_list.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'News',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
          ]),
        ),
        // body: const CategoryCardList(),
        /*
          The way  to Use two lists with each other is using Customized List
          called -> CustomScrollView() and there childern called 'slivers[]'
          any wedgit inside this widgrt must be converted to Sliver child by using
          SliverToBoxAdapter(child:)
          [The Solution (Not a good one dur to App performance)]:
          body: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoryCardList()),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
            SliverToBoxAdapter(child: NewsTileList()),
          ],
        )
        */
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: CategoryCardList()),
              SliverToBoxAdapter(child: SizedBox(height: 32)),
              NewsTileListBuilder(apiCategory: 'general'),
            ],
          ),
        )

        // body: const Padding(
        //   padding: EdgeInsets.all(16.0),
        //   child: Column(
        //     children: [
        //       CategoryCardList(),
        //       SizedBox(height: 32),
        //       Expanded(child: NewsTileList()),
        //     ],
        //   ),
        // )
        );
  }
}
