import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_state.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationText extends StatefulWidget {
  const InformationText({ Key? key }) : super(key: key);

  @override
  _InformationTextState createState() => _InformationTextState();
}

class _InformationTextState extends State<InformationText> {
  @override
  Widget build(BuildContext context) {
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