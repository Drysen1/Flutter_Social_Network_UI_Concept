import 'package:equatable/equatable.dart';
import 'package:flutter_social_network_ui_concept/models/profileModel.dart';

class ProfileState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState{}

class ProfileLoadingState extends ProfileState{}

class ProfileLoadedState  extends ProfileState{
  final ProfileModel profile;
  ProfileLoadedState(this.profile);
}