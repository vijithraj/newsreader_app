 import 'package:flutter/material.dart';
import 'package:newsreader_app/class_path/articl_model.dart';

 class News extends StatelessWidget {
  final Article article;
  News({required this.article});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Image(image: NetworkImage(article.uriToImage.toString())),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.title.toString(),
              style: TextStyle(fontSize: 25,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(article.description.toString(),
            style: TextStyle(fontSize: 20,
            color: Colors.black87),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.bottomRight,
              child: Text(article.author.toString(),
              style: TextStyle(fontSize: 15,
              color: Colors.black87),),
            ),
          )
        ],
      )

    );
  }
}
