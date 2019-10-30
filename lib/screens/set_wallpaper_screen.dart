import 'dart:io';
import 'dart:typed_data';

import 'package:actual_wallpaper_app/models/wallpaper.dart';
import 'package:actual_wallpaper_app/providers/wallpapers.dart';
import 'package:actual_wallpaper_app/widgets/tag_tile.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaper/wallpaper.dart';


class SetWallpaperScreen extends StatefulWidget {
  static String routeName = '/wallpaper-screen';

  @override
  _SetWallpaperScreenState createState() => _SetWallpaperScreenState();
}

class _SetWallpaperScreenState extends State<SetWallpaperScreen> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _bottomPartOpacity;
  Animation<double> _topPartOpacity;
  bool fade = true;



  void animate() {
    if (fade) {
      setState(() {
        fade = !fade;
      });
      _controller.forward();
    } else {
      setState(() {
        fade = !fade;
      });
      _controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _bottomPartOpacity = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(curve: Curves.easeInOut, parent: _controller),
    );
    _topPartOpacity = Tween(begin: 1.0, end: .3).animate(
      CurvedAnimation(curve: Curves.easeInOut, parent: _controller),
    );
    // SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final id = ModalRoute.of(context).settings.arguments as String;
    final wallpaper = Provider.of<Wallpapers>(context).findById(id);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            width: double.infinity,
            // child: PinchZoomImage(
            // zoomedBackgroundColor: Colors.red,
            // hideStatusBarWhileZooming: false,
            // image: Center(
            child: ExtendedImage.network(
              wallpaper.wallPaperUrl,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              mode: ExtendedImageMode.gesture,
              // fit: BoxFit.cover,
              enableLoadState: false,
            ),
          ), // TODO image url here

          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FadeTransition(
                child: MyAppBar(),
                opacity: _topPartOpacity,
              ),
              FadeTransition(
                opacity: _topPartOpacity,
                child: IconButton(
                  icon: IconShadowWidget(
                    Icon(
                      Icons.remove_red_eye,
                      color: theme.textTheme.headline.color,
                    ),
                    showShadow: true,
                    shadowColor: theme.primaryColor,
                  ),
                  onPressed: () => animate(),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              FadeTransition(
                opacity: _bottomPartOpacity,
                child: WallpaperOptions(theme: theme, wallpaper: wallpaper),
              )
            ],
          ),
        ],
      ),
      // backgroundColor: Colors.white,
    );
  }
}

class WallpaperOptions extends StatefulWidget {
  // final picturePath = '/data/user/0/Pictures/Wallpaper/';
  const WallpaperOptions({
    Key key,
    @required this.theme,
    this.wallpaper,
  }) : super(key: key);

  final ThemeData theme;
  final WallPaper wallpaper;

  @override
  _WallpaperOptionsState createState() => _WallpaperOptionsState();
}

class _WallpaperOptionsState extends State<WallpaperOptions> {
  String home = "Home Screen", lock = "Lock Screen", both = "Both Screen", system = "System";
  Stream<String> progressString;
  String res;
  bool downloading = false;
  Future<File> file(String filename, String url) async {
    Dio dio = new Dio();
    Response response;
    Directory dir = await getApplicationDocumentsDirectory();
    dir = dir.parent;
    response = await dio.download(url, '${dir.path}/$filename');
    return File('${dir.path}/$filename');
  }

  /**
  
   *  TODO MAKE THE FIRST SCREEN MORE [WAIT NO NETWORK !! , AND RELOAD OR TRY AGAIN STUFF]
   * also a toast when download pressed 
   */

  Future<void> onSharePress(String text, String url) async {
    //TODO put the app name here
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file('ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg',
            text: 'Some Random Text *not so random*')
        .then((_) => Fluttertoast.showToast(
            msg: 'Share', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Container(
          height: 175,
          width: double.infinity,
          // height: MediaQuery.of(context).size.height - 200,
          decoration: BoxDecoration(
              color: widget.theme.primaryColor.withOpacity(.6),
              // widget.themeData.primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 26.0, left: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.wallpaper.title,
                      style: widget.theme.textTheme.body1,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.crop),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.cloud_download),
                    onPressed: () async {
                      var myfile = await file(
                          widget.wallpaper.title + '.png', widget.wallpaper.wallPaperUrl);
                      print(myfile);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      onSharePress('Hello', widget.wallpaper.wallPaperUrl);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Text(
                  //   !downloading

                  //       ? 'Not yet'
                  //       : 'Downloading $progressString',
                  //   style: widget.themeData.textTheme.body2,
                  // )
                ],
              ),
              Container(
                height: 50,
                width: 800,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.wallpaper.tags.length,
                  itemBuilder: (ctx, i) => TagTile(
                    backgroundColor: widget.theme.textTheme.headline.color,
                    text: widget.wallpaper.tags[i],
                    textColor: widget.theme.primaryColor,
                  ),

                  //TODO put tags here and maybe change it to listview.builder
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
          right: 16.0,
          top: 0.0,
          child: FloatingActionButton(
              backgroundColor: widget.theme.textTheme.headline.color,
              tooltip: 'Set as Wallpaper',
              // backgroundColor: widget.themeData.primaryColor,
              child: Icon(
                Icons.format_paint,
                // color: widget.themeData.accentColor,
              ),
              onPressed: () {
                progressString = Wallpaper.ImageDownloadProgress(widget.wallpaper.wallPaperUrl);
                progressString.listen((data) {
                  setState(() {
                    res = data;
                    downloading = true;
                  });
                  print("DataReceived: " + data);
                }, onDone: () async {
                  lock = await Wallpaper.bothScreen();
                  setState(() {
                    downloading = false;
                    lock = lock;
                  });
                  print("Task Done");
                }, onError: (error) {
                  setState(() {
                    downloading = false;
                  });
                  print("Some Error");
                });
              }))
    ]);
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 10),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: IconShadowWidget(
              Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              showShadow: true,
              shadowColor: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
