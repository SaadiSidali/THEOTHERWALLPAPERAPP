import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(backgroundImage: AssetImage('assets/images/logo.png'),backgroundColor: Colors.deepOrange,),
                title: Text('User Name'),
                subtitle: Text('subtitle',style: TextStyle(color: Colors.grey[500],fontSize: 16),),
                onTap: () {
                  print('object');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
