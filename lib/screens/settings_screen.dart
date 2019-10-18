import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/Themes.dart';
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with ChangeNotifier{
  bool _checkTheme = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedTheme = Provider.of<Themes>(context);
    
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.brightness_4,
              color: theme.textTheme.headline.color,
            ),
            title: Text(
              'Enable Dark theme',
              style: theme.textTheme.headline.copyWith(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            onTap: () {},
            trailing: Checkbox(
              checkColor: theme.primaryColor,
              activeColor: theme.textTheme.headline.color,
              onChanged: (value) {
                setState(() {
                  _checkTheme = value;
                  Themes.isDarkTheme = value;
                  notifyListeners();
                });
              },
              value: _checkTheme,
            ),
          ),
          ListTile(),
          ListTile(),
        ],
      ),
    );
  }
}
