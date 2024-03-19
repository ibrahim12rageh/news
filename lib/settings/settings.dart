import 'package:application_news/my_theme.dart';
import 'package:application_news/provider/app_config_provider.dart';
import 'package:application_news/settings/language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return  Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.language,
              style:Theme.of(context).textTheme.titleLarge?.copyWith(
                color: MyTheme.blackColor
              ) ,),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: (){
                showLanguageBottomSheet();
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: MyTheme.primaryLightColor,
                    width: 2
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                        provider.appLanguage=='ar'?
                        AppLocalizations.of(context)!.arabic
                            :
                        AppLocalizations.of(context)!.english
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => LanguageBottomSheet()
    );
  }
}


