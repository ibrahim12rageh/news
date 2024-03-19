import 'package:application_news/model/SourceResponse.dart';
import 'package:application_news/my_theme.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source ;
  TabItem({required this.isSelected,required this.source});
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: MyTheme.primaryLightColor,
              width: 2
        ),
        borderRadius: BorderRadius.circular(15),
        color: isSelected ? MyTheme.primaryLightColor : Colors.transparent
      ),
      child: Text(source.name ?? ''
        ,style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: isSelected ? MyTheme.whiteColor : MyTheme.primaryLightColor,
          fontSize: 18
        ) ,),
    );
  }
}
