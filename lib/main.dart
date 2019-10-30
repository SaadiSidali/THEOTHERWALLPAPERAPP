import 'package:actual_wallpaper_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import './utils/Themes.dart';
import './providers/wallpapers.dart';
import './screens/set_wallpaper_screen.dart';
// import './screens/splash_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.standard();


  

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Wallpapers(),
        ),
        ChangeNotifierProvider.value(
          value: Themes(),
        )
      ],
      child: MaterialApp(
        theme: Themes.currentTheme(),
        // darkTheme: kDarkTheme,
        title: 'Wallpapers',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (ctx) => TabsScreen(),
          SetWallpaperScreen.routeName: (ctx) => SetWallpaperScreen(),
        },
      ),
    );
  }
}
