import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_event.dart';
import 'package:flutter_social_network_ui_concept/widgets/home/profilesGridView.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
    var size = MediaQuery.of(context).size;
    return kIsWeb ? _webMainUI(size) : _mainUI(size);
  }

  Widget _webMainUI(Size size){
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: size.width > 1000 ? 1000 : double.infinity,
        child: ProfilesGridView(scrollController: _scrollController,)
      ),
    );
  }

  Widget _mainUI(Size size){
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: false,
      showTrackOnHover: true,
      child: 
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: size.width > 1200 ? 1200 : double.infinity,
          child: ProfilesGridView(scrollController: _scrollController,)
        ),
      ),
    );
  }

}