import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_event.dart';
import 'package:flutter_social_network_ui_concept/widgets/home/profilesGridView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _homeBloc; 
  late ScrollController _scrollController;
  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(LoadProfilesEvent());
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: false,
      showTrackOnHover: true,
      child: ProfilesGridView(scrollController: _scrollController,),
    );
  }
}