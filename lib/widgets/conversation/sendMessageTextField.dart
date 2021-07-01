import 'package:flutter/material.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversation/conversation_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversation/conversation_event.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessageTextField extends StatefulWidget {
  const SendMessageTextField({ Key? key }) : super(key: key);

  @override
  _SendMessageTextFieldState createState() => _SendMessageTextFieldState();
}

class _SendMessageTextFieldState extends State<SendMessageTextField> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
      child: TextField(
        controller: _messageController,
        cursorColor: Theme.of(context).primaryColor,
        maxLength: 140,
        minLines: 1,
        maxLines: 8,
        style: GoogleFonts.poppins(
          color: Colors.white70,
          fontSize: 16
        ),
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          focusColor: Theme.of(context).primaryColor,
          suffixIcon: _sendMessageIcon(),
          hintText: 'Message...',
          hintStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
                width: 0, 
                style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(22, 16, 22, 16),
        fillColor: Color.fromARGB(255, 38, 38, 38),
        ),
      )
    );
  }

  Widget _sendMessageIcon(){
    return IconButton(
      icon: Icon(
        Icons.send_rounded,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: (){
        context.read<ConversationBloc>().add(SendMessageEvent(_messageController.text));
      }
    );
  }
}