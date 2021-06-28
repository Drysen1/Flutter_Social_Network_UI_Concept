import 'package:flutter/material.dart';
import 'package:flutter_social_network_ui_concept/models/conversationModel.dart';
import 'package:flutter_social_network_ui_concept/widgets/profileImage.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationItem extends StatefulWidget {
  final ConversationModel conversation;
  const ConversationItem({ Key? key, required this.conversation }) : super(key: key);

  @override
  _ConversationItemState createState() => _ConversationItemState();
}

class _ConversationItemState extends State<ConversationItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      onTap: (){},
      leading: Container( 
        width: 55, 
        height: 55, 
        child: ProfileImage(image: this.widget.conversation.profileImage),
      ),
      title: _nameText(),
      subtitle: _messageText()
    );
  }

  Widget _nameText(){
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 2, 0, 1),
      child: Text(
        "${this.widget.conversation.username}",
        style: GoogleFonts.poppins(
          color: Theme.of(context).primaryColor,
          fontSize: 18
        ) 
      ),
    );
  }

  Widget _messageText(){
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 1, 0, 4),
      child: Row(
        children: [
          Flexible(
            child: Text(
              "${this.widget.conversation.lastMessage}",
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 14
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}