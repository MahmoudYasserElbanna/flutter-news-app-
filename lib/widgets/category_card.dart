import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                apiCategory: category.categoryTitle,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: 180,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(category.imageSrc),
              fit: BoxFit.fill,
            )),
        child: Center(
          child: Text(
            category.categoryTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
