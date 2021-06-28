import 'package:equatable/equatable.dart';
import 'package:flutter_social_network_ui_concept/models/conversationModel.dart';

class ConversationsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConversationsInitialState extends ConversationsState{}

class ConversationsLoadingState extends ConversationsState{}

class ConversationsLoadedState extends ConversationsState{
  final List<ConversationModel> conversations;
  ConversationsLoadedState(this.conversations);
}