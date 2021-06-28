import 'package:flutter_social_network_ui_concept/enums/conversationStatus.dart';

class ConversationModel {
  int id;
  String username;
  String profileImage;
  String lastMessage;
  DateTime lastMessageDate;
  ConversationStatus status;

  ConversationModel(this.id, this.username, this.profileImage, this.lastMessage, this.lastMessageDate, this.status);
}