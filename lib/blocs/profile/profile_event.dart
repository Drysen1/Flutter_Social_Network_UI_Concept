import 'package:equatable/equatable.dart';

class ProfileEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadProfileEvent extends ProfileEvent{
  final int profileId;
  LoadProfileEvent(this.profileId);
}