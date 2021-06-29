import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_state.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationHolder extends StatefulWidget {
  const LocationHolder({ Key? key }) : super(key: key);

  @override
  _LocationHolderState createState() => _LocationHolderState();
}

class _LocationHolderState extends State<LocationHolder> {
  @override
  Widget build(BuildContext context) {
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
}