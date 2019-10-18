import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String catTitle;
  final String backgroundImg;
  CategoryTile({this.backgroundImg, this.catTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 100,
      width: 350,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: theme.primaryColor, blurRadius: 1),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Center(child:
            Container(color: Colors.pinkAccent.withOpacity(.4),)
            // child: FadeInImage(
            //   placeholder: AssetImage('assets/images/placeholder.png'),
            //   image: NetworkImage(backgroundImg),
            // ),
          ),
          Center(
            child: Text(
              catTitle,
              style: TextStyle(
                color: theme.textTheme.headline.color,
                shadows: [
                  Shadow(color: theme.primaryColor,blurRadius: 5),
                ],
              ),
            ),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
