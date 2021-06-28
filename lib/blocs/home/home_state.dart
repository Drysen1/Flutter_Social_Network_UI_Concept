import 'package:equatable/equatable.dart';
import 'package:flutter_social_network_ui_concept/models/profileModel.dart';

class HomeState extends Equatable{
  const HomeState();
  @override
  List<Object?> get props => [];
}

class InitalHomeState extends HomeState{}

class ProfilesLoadingState extends HomeState{}

class ProfilesLoadedState extends HomeState{
  final List<ProfileModel> profiles;

  ProfilesLoadedState(this.profiles);
}