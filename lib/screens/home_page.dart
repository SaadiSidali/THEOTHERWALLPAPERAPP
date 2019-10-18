import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../providers/wallpapers.dart';
import '../widgets/wallpaper_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final wallpapers = Provider.of<Wallpapers>(context, listen: false).wallpapers;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: CarouselSlider(
                // aspectRatio: .2,
                enlargeCenterPage: true,
                autoPlay: true,
                // height: 300,
                items: <Widget>[
                  ...wallpapers
                      .map((wal) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: WallpaperCard(
                              isCarousel: true,
                              id: wal.id,
                              wallpaperUrl: wal.wallPaperUrl,
                            ),
                          ))
                      .toList()
                ],
              ),
            ),
            Divider(),
            Container(
              height: 800,
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                // shrinkWrap: true,
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 3,
                childAspectRatio: 15/28,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                padding: EdgeInsets.all(15),

                // Generate 100 widgets that display their index in the List.
                children: [
                  ...wallpapers
                      .map((wallpaper) => WallpaperCard(
                            id: wallpaper.id,
                            wallpaperUrl: wallpaper.wallPaperUrl,
                          ))
                      .toList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
