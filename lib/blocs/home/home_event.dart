import 'package:equatable/equatable.dart';
import 'package:flutter_social_network_ui_concept/models/profileModel.dart';

class HomeEvent extends Equatable{
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class LoadProfilesEvent extends HomeEvent{}

class ProfileClickedEvent extends HomeEvent{
  final ProfileModel profile;
  ProfileClickedEvent(this.profile);
}