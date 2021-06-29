import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_state.dart';
import 'package:flutter_social_network_ui_concept/models/conversationModel.dart';
import 'package:flutter_social_network_ui_concept/widgets/messages/conversationItem.dart';

class ConversationListView extends StatefulWidget {
  const ConversationListView({ Key? key }) : super(key: key);

  @override
  _ConversationListViewState createState() => _ConversationListViewState();
}

class _ConversationListViewState extends State<ConversationListView> {
  @override
  Widget build(BuildContext context) {
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