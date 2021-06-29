import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_event.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_event.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_state.dart';
import 'package:flutter_social_network_ui_concept/widgets/profileImage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _profileBloc.add(LoadProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: _mainUI(),
      )
    );
  }

  Widget _mainUI(){
    return Column(children: [
        SizedBox(height: 20,),
        _profileImage(),
        SizedBox(height: 30,),
        _username(),
        SizedBox(height: 40,),
        _locationHolder(),
        SizedBox(height: 10,),
        _informationText()
      ],
    );
  }

  Widget _profileImage(){
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (oldState, newState){
        return newState is ProfileLoadedState;
      },
      builder: (context, state){
        var image = "assets/images/profileImage.png";
        if(state is ProfileLoadedState){
          image = state.profile.image;
        }
        return ProfileImage(image: image, size: 140);
      }
    );    
  }

  Widget _username(){
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (oldState, newState){
        return newState is ProfileLoadedState;
      },
      builder: (context, state){
        var username = "";
        if(state is ProfileLoadedState){
          username = "${state.profile.firstName} ${state.profile.lastName}";
        }
        return Text(
          username,
          style: GoogleFonts.yesevaOne(
            color: Theme.of(context).primaryColor,
            fontSize: 30
          ) 
        );
      }
    );  
  }

  Widget _locationHolder(){
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (oldState, newState){
        return newState is ProfileLoadedState;
      },
      builder: (context, state){
        var location = "";
        if(state is ProfileLoadedState){
          location = state.profile.location;
        }
        return _location(location);
      }
    );
  }

  Widget _location(String location){
    return Row(
      children: [
        Icon(
          Icons.place,
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
        Text(
          location,
          style: GoogleFonts.poppins(
            color: Theme.of(context).primaryColor,
            fontSize: 16
          ),
        ),
      ],
    );
  }

  Widget _informationText(){
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (oldState, newState){
        return newState is ProfileLoadedState;
      },
      builder: (context, state){
        var information = "";
        if(state is ProfileLoadedState){
          information = state.profile.information;
        }
        return Text(
          information,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 16
          ),
          overflow: TextOverflow.fade,
        );
      }
    );
  }
}