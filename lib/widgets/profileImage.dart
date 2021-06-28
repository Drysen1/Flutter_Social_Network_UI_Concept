import 'package:flutter/material.dart';

class ProfileImage extends StatefulWidget {
  final String image;
  const ProfileImage({ Key? key, required this.image }) : super(key: key);

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Theme.of(context).primaryColor,
      ),
      child: _innerContainer(),
    );
  }

  Widget _innerContainer(){
    return Container(
      padding: EdgeInsets.all(4),
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Color.fromARGB(255, 46, 46, 46),
      ),
      child: _roundImage()
    );
  }

  Widget _roundImage(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: Image.asset(this.widget.image) 
    );
  }
}