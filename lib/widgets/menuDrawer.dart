import 'package:flutter/material.dart';
import 'package:flutter_social_network_ui_concept/widgets/fullNavbarItem.dart';

class MenuDrawer extends StatefulWidget {
  final int currentPage;
  final setCurrentPage;
  const MenuDrawer({ Key? key, required this.currentPage, this.setCurrentPage }) : super(key: key);

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            SizedBox(height: 40,),
            FullNavbarItem(title: "Home", icon: Icons.home_max, pageIndex: 0, currentPage:  this.widget.currentPage, isDrawer: true, setCurrentPage: this.widget.setCurrentPage),
            SizedBox(height: 40,),
            FullNavbarItem(title: "Messages", icon: Icons.messenger_outline_rounded, pageIndex: 1, currentPage:  this.widget.currentPage, isDrawer: true, setCurrentPage: this.widget.setCurrentPage),
            SizedBox(height: 40,),
            FullNavbarItem(title: "Profile", icon: Icons.person, pageIndex: 2, currentPage:  this.widget.currentPage, isDrawer: true, setCurrentPage: this.widget.setCurrentPage),
          ],
        )
      )
    );
  }
}