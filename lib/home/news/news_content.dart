import 'package:application_news/model/NewsResponse.dart';
import 'package:application_news/my_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsContent extends StatelessWidget {
  static const String routeName = ' News content';
  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic> ;
    var name = news['nameSource'];
    var magazine = news['magazine'] ;
    return Stack(
        children: [
          Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/main_background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(name),
            ),
            body: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: magazine.urlToImage ?? '',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.28,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator(
                        backgroundColor: MyTheme.primaryLightColor,
                      )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  // Container(
                  //   clipBehavior: Clip.antiAlias,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20)
                  //   ),
                  //   child: Image.network(news.urlToImage ?? ''),
                  // )
                  SizedBox(
                    height: 10,
                  ),

                  Text(magazine.author ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: MyTheme.grayColor
                    ),),

                  SizedBox(
                    height: 10,
                  ),

                  Text(magazine.title ?? '',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyTheme.grayColor
                    ),),

                  SizedBox(
                    height: 10,
                  ),

                  Text(magazine.publishedAt ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: MyTheme.grayColor
                    ),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(magazine.content ?? '',style: Theme.of(context).textTheme.bodySmall,),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      final url = magazine.url ;
                      launchUrl(
                        Uri.parse(url ?? ''),
                        mode: LaunchMode.inAppWebView
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('View Article'),
                        SizedBox(
                          height: 10,
                        ),
                        Icon(Icons.play_arrow),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]
    );
  }

}
