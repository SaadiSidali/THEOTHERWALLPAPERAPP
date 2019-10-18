import 'package:actual_wallpaper_app/dummy_data.dart';
import 'package:flutter/material.dart';

import '../widgets/category_tile.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: DUMMY_CATEGORIES.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: CategoryTile(
          backgroundImg: DUMMY_CATEGORIES[i].imageUrl,
          catTitle: DUMMY_CATEGORIES[i].name,
        ),
      ),
    );
  }
}
