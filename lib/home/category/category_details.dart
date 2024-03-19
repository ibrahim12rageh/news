import 'package:application_news/api/api_manager.dart';
import 'package:application_news/model/category.dart';
import 'package:application_news/provider/app_config_provider.dart';
import 'package:application_news/tab/tab_widget.dart';
import 'package:application_news/model/SourceResponse.dart';
import 'package:application_news/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category details';
  CategoryDM category ;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return  FutureBuilder<SourceResponse?>(
              future: ApiManager.getSources(widget.category.id),
              builder: (context,snapshot) {
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
                        ApiManager.getSources(widget.category.id);
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
                        ApiManager.getSources(widget.category.id);
                        setState(() {

                        });
                      }, child: Text('Try Again'))
                    ],
                  );
                }
                var sourcesList = snapshot.data?.sources ?? [];
                return TabWidget(sourcesList: sourcesList);

              }
            );
  }
}

