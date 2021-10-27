import 'package:flutter/material.dart';
import "../dummy_data.dart";
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Meal App')),
        body: GridView(padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2, //height/width
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          //Sliver are just Scrollable.here the Task of arranging our children is delegated
          children: DUMMY_CATEGORIES
              .map((data){
                print(data);
                return CategoryItem(id:data.id,title: data.title, color: data.color);
              
              })
              .toList(),
        ));
  }
}
