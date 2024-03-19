import 'package:application_news/drawer/home_drawer.dart';
import 'package:application_news/home/category/category_details.dart';
import 'package:application_news/home/category/category_fragment.dart';
import 'package:application_news/model/category.dart';
import 'package:application_news/my_theme.dart';
import 'package:application_news/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'search/my_search.dart';

class HomeScreen extends StatefulWidget {

  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
          title: Text(
            selectedMenuItem == HomeDrawer.settings ?
               AppLocalizations.of(context)!.settings  :
                selectedCategory == null ?
                AppLocalizations.of(context)!.app_title :
                    selectedCategory!.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
                onPressed: (){
                  showSearch(
                      context: context,
                      delegate: MySearchDelegate()
                  );
                },
                icon: Icon(Icons.search))          ],
        ),
        drawer: Drawer(
          child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick,),
        ),
        body: selectedMenuItem == HomeDrawer.settings ?
            SettingsTab() :
        selectedCategory == null ?
        CategoryFragment(onCategoryItemClick: onCategoryItemClick,) :
        CategoryDetails(category: selectedCategory!),
      )
    ]);
  }

  CategoryDM? selectedCategory;

  void onCategoryItemClick(CategoryDM newSelectedCategory){
    selectedCategory = newSelectedCategory ;
    setState(() {

    });
  }

  int selectedMenuItem = HomeDrawer.categories;
  void onSideMenuItemClick(int newSelectedMenuItem){
    selectedMenuItem = newSelectedMenuItem ;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}
