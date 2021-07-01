import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversation/conversation_bloc.dart';
import 'package:flutter_social_network_ui_concept/models/conversationModel.dart';
import 'package:flutter_social_network_ui_concept/screens/conversationScreen.dart';
import 'package:flutter_social_network_ui_concept/widgets/profileImage.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationsItem extends StatefulWidget {
  final ConversationModel conversation;
  const ConversationsItem({ Key? key, required this.conversation }) : super(key: key);

  @override
  _ConversationsItemState createState() => _ConversationsItemState();
}

class _ConversationsItemState extends State<ConversationsItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: _listItem()
      ),
      onTap: (){
         Navigator.of(context).push(
          MaterialPageRoute(
          builder: (BuildContext context) =>
            BlocProvider(
              create: (context) => ConversationBloc(),
              child: ConversationScreen(conversationId: this.widget.conversation.id, username: this.widget.conversation.username, profileImage: this.widget.conversation.profileImage)
            )
          )
        );       
      }
    );
  }

  Widget _listItem(){
    return Row(
      children: [
        ProfileImage(image: this.widget.conversation.profileImage, size: 55),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nameText(),
              Row(
                children: [
                  Expanded(child: _messageText()),
                ],
              )
            ],
          ),
        )
      ],
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