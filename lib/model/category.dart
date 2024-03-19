import 'package:application_news/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryDM {
  String id;
  String title;
  String imagePath;
  Color color;

  CategoryDM({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.color,
});

  static List<CategoryDM>getCategories(BuildContext context){
    /*
    business entertainment general health science sports technology
    */
    return [

      CategoryDM(id: 'sports', title: AppLocalizations.of(context)!.sports,
          imagePath: 'assets/images/sports.png', color: MyTheme.redColor),

      CategoryDM(id: 'general', title: AppLocalizations.of(context)!.general,
          imagePath: 'assets/images/Politics.png', color: MyTheme.darkBlueColor),

      CategoryDM(id: 'health', title: AppLocalizations.of(context)!.health,
          imagePath: 'assets/images/health.png', color: MyTheme.pinkColor),

      CategoryDM(id: 'business', title: AppLocalizations.of(context)!.business,
          imagePath: 'assets/images/bussines.png', color: MyTheme.brownColor),

      CategoryDM(id: 'entertainment', title: AppLocalizations.of(context)!.environment,
          imagePath: 'assets/images/environment.png', color: MyTheme.blueColor),

      CategoryDM(id: 'science', title: AppLocalizations.of(context)!.science,
          imagePath: 'assets/images/science.png', color: MyTheme.yellowColor),

    ];
  }
}