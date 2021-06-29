import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_event.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_state.dart';
import 'package:flutter_social_network_ui_concept/models/profileModel.dart';
import 'package:flutter_social_network_ui_concept/repository/profileRepository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  ProfileBloc() : super(ProfileInitialState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if(event is LoadProfileEvent){
      yield* _mapLoadProfileEventToState();
    }
  }

  Stream<ProfileState> _mapLoadProfileEventToState() async*{
    yield ProfileLoadingState();
    var profile = _getProfile();
    yield ProfileLoadedState(profile);
  }

  ProfileModel _getProfile(){
    var profileRepository = ProfileRepository();
    return profileRepository.getMyProfile();
  }

}