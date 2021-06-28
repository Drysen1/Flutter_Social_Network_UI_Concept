import 'package:flutter_social_network_ui_concept/models/profileModel.dart';

class ProfileRepository {
  List<ProfileModel> getProfiles(){
    List<ProfileModel> profiles = [];

    var janeDoe = ProfileModel(0, "Jane", "Doe", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "City, Country", 'assets/images/profileImage.png');
    var johnDoe = ProfileModel(0, "John", "Doe", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", "City, Country", 'assets/images/profileImage.png');
 
    for( var i = 0 ; i < 30; i++ ) { 
      if(i % 2 == 0){
        profiles.add(janeDoe);
      } else {
        profiles.add(johnDoe);
      }
    } 
    
    return profiles;
  }
}