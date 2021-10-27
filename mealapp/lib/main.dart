import 'package:flutter/material.dart';
import './Widgets/categoriesScreen.dart';
import './Widgets/category_meals.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Colors.white,
       fontFamily: 'Raleway',
       textTheme: ThemeData.light().textTheme.copyWith(
         bodyText1: TextStyle(color:Colors.black12),
         caption: TextStyle(fontSize: 24,fontFamily: 'RobotoCondensed')
       )
      ),
      // home: MyHomePage(),//Marks as the entry point or root screen of our app.
      routes: {
        '/':(ctx)=> MyHomePage(),
        CategoryMeals.routeName:(ctx) => CategoryMeals()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
    @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: CategoriesScreen(),
      ),
      
      
    );
  }
}
