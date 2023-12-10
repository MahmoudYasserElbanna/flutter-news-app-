import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';

class NewsService {
  final Dio dio;
  const NewsService({required this.dio});
  // Method that get news overall
  Future<List<ArticleModel>> getTopHeadlines({required apiCategory}) async {
    try {
      // We use Async programming due to delay from internet
      // When we use await keyword we must covert function to async one
      Response responseFromApi = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey='YOUR API KEY'&category=$apiCategory');
      // Using Map<String, dynamic> becuase we know the data structure of API
      Map<String, dynamic> jsonData = responseFromApi.data;
      List<dynamic> article = jsonData['articles'];

      // Create empty list with datatype ArticlModel
      // * List<ArticleModel> articalesList = [];
      // To convert Information from API (Map) to ArticelModel and put it in list

      /** Simple Way :-
    for (var article in articles) {
      // Conversion loop
      ArticleModel articleModel = ArticleModel(
        // source: Source(id: article['source']['id'], name: article['source']['name']),
        image: article['urlToImage'],
        title: article['title'],
        subTitle: article['description'],
      );
      // article has been added to articleList
      articleList.add(articleModel);
    }
    return articlesList;
    */

      // Professional Way
      return article.map(
        (article) {
          return ArticleModel(
            image: article['urlToImage'],
            title: article['title'],
            subTitle: article['description'],
          );
        },
      ).toList();
    } catch (error) {
      print('Error fetching news: $error');
      throw Exception('Failed to load articles');
    }
  }
}
