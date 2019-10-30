import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import './home_page.dart';
import './categories_screen.dart';
import './settings_screen.dart';
import '../widgets/my_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 1);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([
    //   SystemUiOverlay.bottom,SystemUiOverlay.top
    // ]);
    final headline = Theme.of(context).textTheme.headline;

    return Scaffold(
        // bottomNavigationBar: BottomAppBar(),
        // backgroundColor: Colors.redAccent,
        
        drawer: MyDrawer(),
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(icon: Icon(Icons.add_photo_alternate),onPressed: (){},),)
          ],
          bottom: TabBar(
            controller: _tabController,
            // dragStartBehavior: DragStartBehavior.down,

            indicatorColor: headline.color,
            labelColor: headline.color,
            tabs: <Widget>[
              Tab(
                icon: Icon(_tabController.index == 0 ? Icons.category : OMIcons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(_tabController.index == 1 ? Icons.home : OMIcons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(_tabController.index == 2 ? Icons.settings : OMIcons.settings),
                text: 'Settings',
              ),
            ],
          ),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 45,
                width: 45,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Wallpaper',
                style: headline,
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            CategoriesScreen(),
            HomePage(),
            SettingsScreen(),
          ],
        ));
  }
}
