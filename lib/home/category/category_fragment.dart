import 'package:application_news/home/category/category_item.dart';
import 'package:application_news/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryFragment extends StatelessWidget {
 Function onCategoryItemClick ;
 CategoryFragment({required this.onCategoryItemClick});
  @override
  Widget build(BuildContext context) {
    var categoriesList = CategoryDM.getCategories(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.pick_your_category,
            style: Theme.of(context).textTheme.titleMedium
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15
                ),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      onCategoryItemClick(categoriesList[index]);
                    },
                      child: CategoryItem(category: categoriesList[index], index: index));
                },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
