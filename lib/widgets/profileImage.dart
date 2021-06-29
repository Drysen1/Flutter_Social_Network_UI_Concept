import 'package:flutter/material.dart';

class ProfileImage extends StatefulWidget {
  final double size;
  final String image;
  const ProfileImage({ Key? key, required this.image, required this.size }) : super(key: key);

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      width: this.widget.size,
      height: this.widget.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(this.widget.size / 2),
        color: Theme.of(context).primaryColor,
      ),
      child: _innerContainer(),
    );
  }

  Widget _innerContainer(){
    return Container(
      padding: EdgeInsets.all(4),
      width: this.widget.size - 2,
      height: this.widget.size - 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(this.widget.size / 2),
        color: Color.fromARGB(255, 46, 46, 46),
      ),
      child: _roundImage()
    );
  }

  Widget _roundImage(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(this.widget.size / 2),
      child: Image.asset(this.widget.image) 
    );
  }
}