import 'package:equatable/equatable.dart';
import 'package:flutter_social_network_ui_concept/models/conversationReplyModel.dart';

class ConversationState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ConversationInitialState extends ConversationState{}

class ConversationLoadingState extends ConversationState{}

class ConversationLoadedState extends ConversationState{
  final List<ConversationReplyModel> conversation;
  ConversationLoadedState(this.conversation);
}

class MessageSentState extends ConversationState{}