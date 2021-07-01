import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_event.dart';
import 'package:flutter_social_network_ui_concept/widgets/conversations/conversationsListView.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({ Key? key }) : super(key: key);

  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  late ConverationsBloc _converationsBloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    _converationsBloc = BlocProvider.of<ConverationsBloc>(context);
    _converationsBloc.add(LoadConversationEvent());
    _scrollController = ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: false,
      showTrackOnHover: true,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: size.width > 700 ? 700 : double.infinity,
          child: ConversationsListView()
        ),
      ),
    );
  }
}