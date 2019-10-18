import 'package:flutter/material.dart';

import '../models/wallpaper.dart';
import '../dummy_data.dart';

class Wallpapers with ChangeNotifier {
  List<WallPaper> _wallpapers = [...DUMMY_WALLPAPERS];

  List<WallPaper> get wallpapers {
    return [..._wallpapers];
  }

  WallPaper findById(String id) {
    return _wallpapers.firstWhere((wal) => wal.id == id);
  }
}
