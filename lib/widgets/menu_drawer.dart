import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Settings'),
            backgroundColor: Colors.orange,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.refresh),
            title: Text('Get latest price'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Change currency ₿ <=> \$'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
