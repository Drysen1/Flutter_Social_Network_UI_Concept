import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_event.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_state.dart';
import 'package:flutter_social_network_ui_concept/models/conversationModel.dart';
import 'package:flutter_social_network_ui_concept/widgets/messages/conversationItem.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({ Key? key }) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
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
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: false,
      showTrackOnHover: true,
      child: _conversationsListView(),
    );
  }

  Widget _conversationsListView(){
    return BlocBuilder<ConverationsBloc, ConversationsState>(
      buildWhen: (oldState, newState){
        return newState is ConversationsLoadedState;
      },
      builder: (context, state){
        List<ConversationModel> conversations = [];
        if(state is ConversationsLoadedState){
          conversations = state.conversations;
        }
        return ListView.builder(
          itemCount: conversations.length,
          itemBuilder: (context, index){
            return ConversationItem(conversation: conversations[index]);
          }
        );
      }
    );
  }


}