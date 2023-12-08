import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoryCardList extends StatelessWidget {
  const CategoryCardList({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(categoryTitle: 'Business', imageSrc: 'assets/business.avif'),
    CategoryModel(
        categoryTitle: 'Entertainment', imageSrc: 'assets/entertaiment.avif'),
    CategoryModel(categoryTitle: 'General', imageSrc: 'assets/general.avif'),
    CategoryModel(categoryTitle: 'Health', imageSrc: 'assets/health.avif'),
    CategoryModel(categoryTitle: 'Science', imageSrc: 'assets/science.avif'),
    CategoryModel(categoryTitle: 'Sports', imageSrc: 'assets/sports.avif'),
    CategoryModel(
        categoryTitle: 'Technology', imageSrc: 'assets/technology.jpeg'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, categoryIndex) {
            return CategoryCard(
              category: categories[categoryIndex],
            );
          }),
    );
  }
}
