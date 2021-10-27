import "package:flutter/material.dart";

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meal';
  // CategoryMeals(this.id, this.pageTitle);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String pageTitle = routeArg['title'] as String;
    final String id = routeArg['id'] as String;

    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      body: ListView.builder(itemBuilder: (context,index) {

      },itemCount: ,)
    );
  }
}
