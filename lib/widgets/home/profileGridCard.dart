import 'package:flutter/material.dart';
import 'package:flutter_social_network_ui_concept/models/profileModel.dart';
import 'package:flutter_social_network_ui_concept/widgets/profileImage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileGridCard extends StatefulWidget {
  final ProfileModel profile;
  const ProfileGridCard({ Key? key, required this.profile }) : super(key: key);

  @override
  _ProfileGridCardState createState() => _ProfileGridCardState();
}

class _ProfileGridCardState extends State<ProfileGridCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Color.fromARGB(255, 29, 29, 29),
      child: _inkWell()
    );
  }

  Widget _inkWell(){
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 8, 16),
        child: _informationRow()
      ),
      onTap: (){}
    );
  }

  Widget _informationRow(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileImage(image: this.widget.profile.image, size: 70),
        SizedBox(width: 20,),
        Expanded(
          child: _informationColumn()
        )
      ],
    );
  }

  Widget _informationColumn(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _nameText(),
        SizedBox(height: 5,),
        _locationHolder(),
        SizedBox(height: 5,),
        _informationText(),
        SizedBox(height: 5,),
        _moreArrow()
      ],
    );
  }

  Widget _locationHolder(){
    return Row(
      children: [
        Icon(
          Icons.place,
          size: 16,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          this.widget.profile.location,
          style: GoogleFonts.poppins(
            color: Theme.of(context).primaryColor,
            fontSize: 12
          ),
        ),
      ],
    );
  }

  Widget _moreArrow(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Read more",
          style: GoogleFonts.poppins(
            color: Theme.of(context).primaryColor,
            fontSize: 16
          ),
        ),
        Icon(
          Icons.double_arrow_rounded,
          size: 22,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(width: 10,)
      ],
    );
  }

  Widget _nameText(){
    return Text(
      "${this.widget.profile.firstName} ${this.widget.profile.lastName}",
      style: GoogleFonts.yesevaOne(
        color: Theme.of(context).primaryColor,
        fontSize: 20
      ) 
    );
  }

  Widget _informationText(){
    return Expanded(
      child: Text(
        "${this.widget.profile.information}",
        style: GoogleFonts.poppins(
          color: Colors.white70,
          fontSize: 14
        ),
        overflow: TextOverflow.fade,
      )
    );
  }
}