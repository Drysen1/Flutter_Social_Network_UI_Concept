import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_state.dart';
import 'package:flutter_social_network_ui_concept/widgets/profileImage.dart';

class UserProfileImage extends StatefulWidget {
  const UserProfileImage({ Key? key }) : super(key: key);

  @override
  _UserProfileImageState createState() => _UserProfileImageState();
}

class _UserProfileImageState extends State<UserProfileImage> {
  @override
  Widget build(BuildContext context) {
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
}