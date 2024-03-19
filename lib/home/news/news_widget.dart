import 'package:application_news/api/api_manager.dart';
import 'package:application_news/home/news/News_item.dart';
import 'package:application_news/home/news/news_content.dart';
import 'package:application_news/model/NewsResponse.dart';
import 'package:application_news/model/SourceResponse.dart';
import 'package:application_news/my_theme.dart';
import 'package:flutter/material.dart';

class  NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId( widget.source.id ?? ''),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              ),
            );
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text('something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceId(widget.source.id ?? '');
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceId(widget.source.id ?? '');
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(NewsContent.routeName,arguments: {
                      'nameSource' : widget.source.name,
                      'magazine' : newsList[index]
                    });
                  },
                    child: NewsItem(news: newsList[index]));
              },
          itemCount: newsList.length,
          );

        });
  }
}
