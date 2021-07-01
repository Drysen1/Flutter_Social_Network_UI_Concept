import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversations/conversations_state.dart';
import 'package:flutter_social_network_ui_concept/models/conversationModel.dart';
import 'package:flutter_social_network_ui_concept/widgets/conversations/conversationsItem.dart';

class ConversationsListView extends StatefulWidget {
  const ConversationsListView({ Key? key }) : super(key: key);

  @override
  _ConversationsListViewState createState() => _ConversationsListViewState();
}

class _ConversationsListViewState extends State<ConversationsListView> {
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
            return ConversationsItem(conversation: conversations[index]);
          }
        );
      }
    );
  }
}