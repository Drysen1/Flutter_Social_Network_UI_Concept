import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_state.dart';
import 'package:flutter_social_network_ui_concept/models/profileModel.dart';
import 'package:flutter_social_network_ui_concept/widgets/profileImage.dart';
import 'package:google_fonts/google_fonts.dart';

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
            return _profileCard(profiles[index]);
          }
        );
      }
    );
  }
  
  Widget _profileCard(ProfileModel profile){
    return Card(
      margin: EdgeInsets.all(7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Color.fromARGB(255, 29, 29, 29),
      child: _inkWell(profile)
    );
  }

  Widget _inkWell(ProfileModel profile){
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 16, 8, 16),
        child: _informationRow(profile)
      ),
      onTap: (){}
    );
  }

  Widget _informationRow(ProfileModel profile){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileImage(image: profile.image),
        SizedBox(width: 20,),
        Expanded(
          child: _informationColumn(profile)
        )
      ],
    );
  }

  Widget _informationColumn(ProfileModel profile){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _nameText(profile.firstName, profile.lastName),
        _informationText(profile.information),
        SizedBox(height: 5,),
        _moreArrow()
      ],
    );
  }

  Widget _moreArrow(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Read more",
          style: GoogleFonts.poppins(
            color: Theme.of(context).primaryColor,
            fontSize: 16
          ),
        ),
        Icon(
          Icons.double_arrow_rounded,
          size: 22,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(width: 10,)
      ],
    );
  }

  Widget _nameText(String firstName, String lastName){
    return Text(
      "$firstName $lastName",
      style: GoogleFonts.yesevaOne(
        color: Theme.of(context).primaryColor,
        fontSize: 20
      ) 
    );
  }

  Widget _informationText(String text){
    return Expanded(
      child: Text(
        "$text",
        style: GoogleFonts.poppins(
          color: Colors.white70,
          fontSize: 14
        ),
        overflow: TextOverflow.fade,
      )
    );
  }
}