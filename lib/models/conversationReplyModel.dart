class ConversationReplyModel {
  int id;
  int conversationId;
  int userId;
  String username;
  String profileImage;
  String message;

  ConversationReplyModel(this.id, this.conversationId, this.userId, this.username, this.profileImage, this.message);
}