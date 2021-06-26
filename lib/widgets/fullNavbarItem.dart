import 'package:flutter/material.dart';

class FullNavbarItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final int pageIndex;
  final int currentPage;
  final bool isDrawer;
  final setCurrentPage;
  const FullNavbarItem({ Key? key, required this.title, required this.icon, required this.pageIndex, required this.currentPage, required this.isDrawer, this.setCurrentPage }) : super(key: key);

  @override
  _FullNavbarItemState createState() => _FullNavbarItemState();
}

class _FullNavbarItemState extends State<FullNavbarItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            _navbarInformation(this.widget.title, this.widget.icon, this.widget.pageIndex),
            SizedBox(height: 10,),
            this.widget.currentPage == this.widget.pageIndex ?_selectedBar() : Container(),
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

  Widget _navbarInformation(String text, IconData icon, int pageIndex){
    return Row(
      children: [
        _navbarIcon(icon, pageIndex), 
        SizedBox(width: 10,),
        _navbarText(text, pageIndex),
      ],
    );
  }

  Widget _navbarIcon(IconData icon, int pageIndex){
    return Icon(
      icon,
      color: this.widget.currentPage == pageIndex ? Theme.of(context).primaryColor: Colors.white70,
    );
  }

  Widget _navbarText(String text, int pageIndex){
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: this.widget.currentPage == pageIndex ? Theme.of(context).primaryColor: Colors.white70,
      )  
    );
  }

  Widget _selectedBar(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        height: 3, 
        width: 50, 
        color: Theme.of(context).primaryColor
      ),
    );
  }  
}