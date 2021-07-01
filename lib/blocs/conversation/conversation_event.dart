import 'package:equatable/equatable.dart';

class ConversationEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadConversationRepliesEvent extends ConversationEvent{
  final int conversationId;
  LoadConversationRepliesEvent(this.conversationId);
}

class SendMessageEvent extends ConversationEvent{
  final String message;
  SendMessageEvent(this.message);
}