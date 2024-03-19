import 'package:application_news/tab/tab_item.dart';
import 'package:application_news/home/news/news_widget.dart';
import 'package:application_news/model/SourceResponse.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourcesList ;

  TabWidget({required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex = index ;
                setState(() {

                });
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourcesList.map((source) => TabItem(
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                  source: source
              )).toList()
            ),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        ),);
  }
}
