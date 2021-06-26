import 'package:flutter/material.dart';

class NavbarItem extends StatefulWidget {
  final IconData icon;
  final int pageIndex;
  final int currentPage;
  final bool isDrawer;
  final setCurrentPage;
  const NavbarItem({ Key? key, required this.icon, required this.pageIndex, required this.currentPage, required this.isDrawer, this.setCurrentPage }) : super(key: key);

  @override
  _NavbarItemState createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            _navbarIconContainer(this.widget.icon, this.widget.pageIndex),
            SizedBox(height: 5,),
          ],
        ),
      ),
      onTap: (){
        setState(() {
          this.widget.setCurrentPage(this.widget.pageIndex);
          if(this.widget.isDrawer){
            Navigator.of(context).pop();
          }
        });
      },
    );
  }

  Widget _navbarIconContainer(IconData icon, int pageIndex){
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color.fromARGB(255, 62, 62, 62)
      ),
      child: _navbarIcon(icon, pageIndex)
    );
  }


  Widget _navbarIcon(IconData icon, int pageIndex){
    return Icon(
      icon,
      size: 22,
      color: this.widget.currentPage == pageIndex ? Theme.of(context).primaryColor: Colors.white70,
    );
  }
}