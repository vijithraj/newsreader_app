 import 'package:flutter/material.dart';
import 'package:newsreader_app/class_path/api_services.dart';
import 'package:newsreader_app/class_path/articl_model.dart';

import 'news_viewpage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService client=ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Daily News",
        style: TextStyle(fontSize: 25,
        color: Colors.white),),
        backgroundColor: Colors.black87,
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Article>>(
        future: client.getArticle(),
        builder: (
        BuildContext context,AsyncSnapshot<List<Article>>snapshot){
          print(snapshot);
          if (snapshot.hasData){
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data?.length,
                itemBuilder: (context,index){
                var articles=snapshot.data![index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>News(
                      article:articles
                    )));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Expanded(child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(snapshot.data![index].uriToImage.toString())
                            )
                          ),
                        )),
                        Expanded(
                          flex: 2,
                            child: Container(
                          height: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data![index].title.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87
                                    ),
                                  ),
                                  Text(
                                    snapshot.data![index].publishedAt.toString(),
                                    style: TextStyle(fontSize: 15,color: Colors.black87),
                                  )
                                ],
                              ),
                        ))
                      ],
                    ),
                  ),
                );

                });
            }
          return Center(
            child: CircularProgressIndicator(),
          );
            }

      ),
    );
  }
}
