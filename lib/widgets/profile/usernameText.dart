import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_state.dart';
import 'package:google_fonts/google_fonts.dart';

class UsernameText extends StatefulWidget {
  const UsernameText({ Key? key }) : super(key: key);

  @override
  _UsernameTextState createState() => _UsernameTextState();
}

class _UsernameTextState extends State<UsernameText> {
  @override
  Widget build(BuildContext context) {
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
}