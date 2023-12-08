import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          articleModel.image ??
              'https://imgs.search.brave.com/v2R7z5-8RRq2lcpWvcsDvzAViT5gAXuJZE-ryNIlZ0c/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzUxLzk1LzUz/LzM2MF9GXzI1MTk1/NTM1Nl9GQVFIMFUx/eTFUWnczWmNkUEd5/YndVa0g5MGEzVkFo/Yi5qcGc',
          height: 250,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      const SizedBox(height: 12),
      Text(
        articleModel.title,
        // Maximum lines
        maxLines: 2,
        // Maximum words in line and replace it by ...
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        articleModel.subTitle ?? 'No Content Avalibale',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 16),
    ]);
  }
}
