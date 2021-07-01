import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversation/conversation_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversation/conversation_state.dart';
import 'package:flutter_social_network_ui_concept/models/conversationReplyModel.dart';
import 'package:flutter_social_network_ui_concept/widgets/conversation/conversationReplyItem.dart';

class ConversationListView extends StatefulWidget {
  const ConversationListView({ Key? key }) : super(key: key);

  @override
  _ConversationListViewState createState() => _ConversationListViewState();
}

class _ConversationListViewState extends State<ConversationListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationBloc, ConversationState>(
      buildWhen: (oldState, newState){
        return newState is ConversationLoadedState;
      },
      builder: (context, state){
        List<ConversationReplyModel> replies = [];
        if(state is ConversationLoadedState){
          replies = state.conversation;
        }
        return ListView.builder(
          reverse: true,
          itemCount: replies.length,
          itemBuilder: (context, index){
            return ConversationReplyItem(reply: replies[index]);
          }
        );
      }
    );
  }
}