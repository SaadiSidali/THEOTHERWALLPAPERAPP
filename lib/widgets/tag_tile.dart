import 'package:flutter/material.dart';

class TagTile extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String text;

  TagTile({
    this.backgroundColor,
    this.text,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              '$text',
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
          SizedBox(width: 10,)
        ],
      ),
    );
  }
}
