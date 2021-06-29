import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_event.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_state.dart';
import 'package:flutter_social_network_ui_concept/widgets/profile/informationText.dart';
import 'package:flutter_social_network_ui_concept/widgets/profile/locationHolder.dart';
import 'package:flutter_social_network_ui_concept/widgets/profile/sendMessageButton.dart';
import 'package:flutter_social_network_ui_concept/widgets/profile/userProfileImage.dart';
import 'package:flutter_social_network_ui_concept/widgets/profile/usernameText.dart';
import 'package:flutter_social_network_ui_concept/widgets/profileImage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  final int profileId;
  const ProfileScreen({ Key? key, required this.profileId }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _profileBloc.add(LoadProfileEvent(this.widget.profileId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return this.widget.profileId > 0 ? _scaffoldUI() : _mainUI();
  }

  Widget _scaffoldUI(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _mainUI(),
    );
  }

  Widget _mainUI(){
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: size.width > 700 ? 700 : double.infinity,
          padding: EdgeInsets.all(20),
          child: _mainColumn(),
        ),
      )
    );
  }

  Widget _mainColumn(){
    return Column(children: [
        SizedBox(height: 20,),
        UserProfileImage(),
        SizedBox(height: 30,),
        UsernameText(),
        SizedBox(height: 40,),
        LocationHolder(),
        SizedBox(height: 10,),
        InformationText(),
        Spacer(),
        this.widget.profileId > 0 ? SendMessageButton() : Container()
      ],
    );
  }
}