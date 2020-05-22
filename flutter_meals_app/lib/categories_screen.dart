import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermealsapp/category_item.dart';
import 'package:fluttermealsapp/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          ...DUMMY_CATEGORIES
              .map((category) => CategoryItem(category.title, category.color))
              .toList()
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
