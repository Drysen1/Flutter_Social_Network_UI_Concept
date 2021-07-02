import 'package:flutter/material.dart';
import 'package:flutter_social_network_ui_concept/models/conversationReplyModel.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationReplyItem extends StatefulWidget {
  final ConversationReplyModel reply;
  const ConversationReplyItem({ Key? key, required this.reply }) : super(key: key);

  @override
  _ConversationReplyItemState createState() => _ConversationReplyItemState();
}

class _ConversationReplyItemState extends State<ConversationReplyItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _messageContainer()
    );
  }

  Widget _messageContainer(){
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(14, 5, 14, 5),
      child: Align(
        alignment: (this.widget.reply.userId == 0 ? Alignment.topRight : Alignment.topLeft),
        child: Container(
          constraints: BoxConstraints(minWidth: 100, maxWidth: 700),
          // width: size.width > 800 ? 700 : double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: this.widget.reply.userId == 0 ? Radius.circular(30) : Radius.circular(0),
              bottomRight: this.widget.reply.userId == 0 ? Radius.circular(0) : Radius.circular(30),
            ),
            color: this.widget.reply.userId == 0 ? Color.fromARGB(255, 38, 38, 38) : Color.fromARGB(255, 117, 99, 53),
          ),
          padding: EdgeInsets.all(16),
          child: _replyText()
        ),
      ),
    );
  }

  Widget _replyText(){
    return Text(
      this.widget.reply.message,
      style: GoogleFonts.poppins(
        color: Colors.white70,
        fontSize: 16
      ) 
    );
  }
}