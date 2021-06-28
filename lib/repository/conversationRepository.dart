import 'package:flutter_social_network_ui_concept/enums/conversationStatus.dart';
import 'package:flutter_social_network_ui_concept/models/conversationModel.dart';
import 'package:flutter_social_network_ui_concept/models/conversationReplyModel.dart';

class ConversationRepository {
  var _longMessageString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
  var _shortMessageString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
  var _reallyShortMessageString = "Lorem ipsum dolor sit amet.";
  var _profileImage = 'assets/images/profileImage.png';
  var _janeDoe = "Jane Doe";
  var _johnDoe = "John Doe";

  List<ConversationModel> getConversations(){
    List<ConversationModel> conversations = [];

    for( var i = 0 ; i < 10; i++ ) { 
      var isUnread = false;

      if(i % 7 == 0){
        isUnread = true;
      }

      if(i % 2 == 0){
        conversations.add(_createConversation(i, _janeDoe, isUnread));
      } else {
        conversations.add(_createConversation(i, _johnDoe, isUnread));
      }
    } 

    return conversations;
  }

  List<ConversationReplyModel> getConversationReplies(int conversationId){
    List<ConversationReplyModel> replies = [];

    for( var i = 0 ; i < 20; i++ ) { 
      if(i % 2 == 0){
        replies.add(_createReply(i, conversationId, 20, _janeDoe));
      } else {
        replies.add(_createReply(i, conversationId, 30, _johnDoe));
      }
    } 

    return replies;
  }

  ConversationModel _createConversation(int id, String username, bool isUnread){
    var status = isUnread ? ConversationStatus.unread : ConversationStatus.read;
    var message = id % 3 == 0 ? _longMessageString : _reallyShortMessageString;
    return ConversationModel(id, username, _profileImage, message, DateTime.now().add(Duration(days: -id)), status);
  }

  ConversationReplyModel _createReply(int id, int conversationid, int userId, String username){
    var message = id % 2 == 0 ? _longMessageString : _shortMessageString;
    return ConversationReplyModel(id, conversationid, userId, username, _profileImage, message);
  }
}