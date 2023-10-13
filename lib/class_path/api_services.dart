import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:newsreader_app/class_path/articl_model.dart';

class ApiService{
  Future<List<Article>>getArticle()async{
    final url="https://newsapi.org/v2/everything?q=bitcoin&apiKey=657f11be08bb4cdeabc1e7e0a9a1f5da";
    var respose=await http.get(Uri.parse(url));
    if (respose.statusCode==200){
      var body=json.decode(respose.body);
      print(body);
      List<Article>data=List<Article>.from(
        body['articles'].map((e)=>Article.fromJson(e)).toList());
      return data;
    }else {
      List<Article>data=[];
      return data;
    }
  }
}