import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/home/home_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/profile/profile_bloc.dart';
import 'package:flutter_social_network_ui_concept/screens/homeScreen.dart';
import 'package:flutter_social_network_ui_concept/screens/conversationsScreen.dart';
import 'package:flutter_social_network_ui_concept/screens/profileScreen.dart';
import 'package:flutter_social_network_ui_concept/widgets/topAppBar.dart';
import 'package:flutter_social_network_ui_concept/widgets/floatingBottomAppBar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TabScreen extends StatefulWidget {
  const TabScreen({ Key? key }) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  String _pageTitle = "Home";
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  setCurrentPage(pageIndex){
    _currentPage = pageIndex;
    _pageController.jumpToPage(pageIndex);
    _setAppBarTitle(pageIndex);
  }

  void _setAppBarTitle(int pageIndex){
    setState(() {    
      switch(pageIndex){
        case 1:{
          _pageTitle = "Chats";
            break;
        }
        case 2:{
          _pageTitle = "Profile";
          break;
        }
        case 0:
        default:{
          _pageTitle = "Home";
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: TopAppBar(pageTitle: _pageTitle, currentPage: _currentPage, setCurrentPage: setCurrentPage),
      bottomNavigationBar: kIsWeb ? null : FloatingBottomAppBar(currentPage: _currentPage, setCurrentPage: setCurrentPage),
      body: _body(),
    );
  }

  Widget _body(){
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        BlocProvider(
          create: (context) => HomeBloc(),
          child: HomeScreen()
        ),
        BlocProvider(
          create: (context) => ConverationsBloc(),
          child: ConversationsScreen()
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
          child: ProfileScreen(profileId: 0,)
        ),
      ],
      onPageChanged: (int pageIndex){
        
      },
    ); 
  }
}