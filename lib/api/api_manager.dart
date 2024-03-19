import 'dart:convert';

import 'package:application_news/api/api_constant.dart';
import 'package:application_news/model/NewsResponse.dart';
import 'package:application_news/model/SourceResponse.dart';
import 'package:http/http.dart' as http;
class ApiManager{


  static Future<SourceResponse> getSources(String categoryID,{String categoryLanguage = 'en'})async{
    Uri url = Uri.https(ApiConstant.baseUrl,ApiConstant.sourcesApi,
      {
        'apiKey' : '0371277408f9488c96c7d876439de322',
        'category' : categoryID,
        "language" : categoryLanguage
      }
    );
    try{
      var response = await http.get(url);
      var responseBody = response.body; //String
      var json =  jsonDecode(responseBody); //json
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }
/*
https://newsapi.org/v2/everything?apiKey=0371277408f9488c96c7d876439de322
*/
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async{
    Uri url = Uri.https(ApiConstant.baseUrl,ApiConstant.newsApi,{
      'apikey' : '0371277408f9488c96c7d876439de322',
      'sources' : sourceId,
    });

    try{
      var response = await http.get(url);
      var responseBody = response.body; //String
      var json =  jsonDecode(responseBody); //json
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }
  }
}

/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY

  0371277408f9488c96c7d876439de322  */
