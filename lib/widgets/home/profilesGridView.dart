import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_state.dart';
import 'package:flutter_social_network_ui_concept/models/profileModel.dart';
import 'package:flutter_social_network_ui_concept/widgets/home/profileGridCard.dart';

class ProfilesGridView extends StatefulWidget {
  final ScrollController scrollController;
  const ProfilesGridView({ Key? key, required this.scrollController}) : super(key: key);

  @override
  _ProfilesGridViewState createState() => _ProfilesGridViewState();
}

class _ProfilesGridViewState extends State<ProfilesGridView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (oldState, newState){
        return newState is ProfilesLoadedState;
      },
      builder: (context, state){
        List<ProfileModel> profiles = [];
        if(state is ProfilesLoadedState){
          profiles = state.profiles;
        }
        return GridView.builder(
          primary: false,
          controller: this.widget.scrollController,
          itemCount: profiles.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            childAspectRatio: 2/1,
            ), 
          itemBuilder: (context, index){
            return ProfileGridCard(profile: profiles[index]);
          }
        );
      }
    );
  }
}