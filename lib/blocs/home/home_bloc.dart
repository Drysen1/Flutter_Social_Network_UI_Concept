import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_event.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_state.dart';
import 'package:flutter_social_network_ui_concept/models/profileModel.dart';
import 'package:flutter_social_network_ui_concept/repository/profileRepository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitalHomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is LoadProfilesEvent){
      yield* _mapLoadProfilesEventToState(event);
    } else if(event is ProfileClickedEvent){

    }
  }

  Stream<HomeState> _mapLoadProfilesEventToState(LoadProfilesEvent event) async*{
    yield ProfilesLoadingState();
    var profiles = _getProfiles();
    yield ProfilesLoadedState(profiles);
  }

  List<ProfileModel> _getProfiles(){
    var profileReopsitory = ProfileRepository();
    return profileReopsitory.getProfiles();
  }
}