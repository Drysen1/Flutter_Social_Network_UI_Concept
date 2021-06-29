import 'package:flutter_social_network_ui_concept/models/profileModel.dart';

class ProfileRepository {
    var _janeDoe = ProfileModel(0, "Jane", "Doe", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "City, Country", 'assets/images/profileImage.png');
    var _johnDoe = ProfileModel(0, "John", "Doe", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "City, Country", 'assets/images/profileImage.png');

  List<ProfileModel> getProfiles(){
    List<ProfileModel> profiles = [];
    for( var i = 0 ; i < 30; i++ ) { 
      if(i % 2 == 0){
        _janeDoe.id = i;
        profiles.add(_janeDoe);
      } else {
        _johnDoe.id = i;
        profiles.add(_johnDoe);
      }
    } 
    
    return profiles;
  }

  ProfileModel getMyProfile(){
    return _janeDoe;
  }
}