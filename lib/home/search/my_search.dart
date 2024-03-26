import 'package:application_news/model/SourceResponse.dart';
import 'package:flutter/material.dart';

 class MySearchDelegate extends SearchDelegate {

  List<String> searchResults=[

  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions= searchResults.where((searchResults) {
      final result = searchResults.toLowerCase();
      final input = searchResults.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context,index){
          final suggestion = suggestions[index];
          return ListTile(
            title: Text(suggestion),
            onTap: (){
              query = suggestion;
              showResults(context);
            },
          );
        },
    );
  }

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
      style: const TextStyle(fontSize: 64 , fontWeight: FontWeight.bold),
    ),
  );

  @override
  List<Widget>? buildActions(BuildContext context) => [
  IconButton(onPressed: (){ query = '' ;}, icon: Icon(Icons.clear))
  ];


}
