import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/set_wallpaper_screen.dart';

class WallpaperCard extends StatelessWidget {
  final String id;
  final String wallpaperUrl;
  final bool isCarousel;

  WallpaperCard({this.id, this.wallpaperUrl, this.isCarousel: false});
  Future<void> onpop() async {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(SetWallpaperScreen.routeName, arguments: id)
            .then((_) => onpop());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 6, offset: Offset(0, 0)),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        height: isCarousel ? 150 : 280,
        width: isCarousel ? 400 : 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FadeInImage(
            fadeInDuration: Duration(milliseconds: 300),
            placeholder: AssetImage('assets/images/placeholder.png'),
            image: NetworkImage(wallpaperUrl),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
