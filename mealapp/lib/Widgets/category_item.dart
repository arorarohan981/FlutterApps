import "package:flutter/material.dart";
import "./category_meals.dart";
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({required this.id,required this.title,required this.color});


  void selectCategory(BuildContext ctx,String Category){
    Navigator.of(ctx).pushNamed(CategoryMeals.routeName,arguments: {'id':id,'title':title}
    );
    //We also have CupertinoPageRoute . It handles animation from one page to another page.
  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap:()=>selectCategory(context,title) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(child: Text(title,style: Theme.of(context).textTheme.caption,)),
    
        
        decoration: BoxDecoration(gradient: LinearGradient(colors: [color.withOpacity(0.5),color],begin: Alignment.topLeft,end: Alignment.bottomRight),borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}