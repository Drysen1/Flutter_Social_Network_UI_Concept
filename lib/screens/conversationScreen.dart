import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversation/conversation_bloc.dart';
import 'package:flutter_social_network_ui_concept/blocs/conversation/conversation_event.dart';
import 'package:flutter_social_network_ui_concept/widgets/conversation/conversationListView.dart';
import 'package:flutter_social_network_ui_concept/widgets/conversation/sendMessageTextField.dart';
import 'package:flutter_social_network_ui_concept/widgets/profileImage.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationScreen extends StatefulWidget {
  final int conversationId;
  final String username;
  final String profileImage;
  const ConversationScreen({ Key? key, required this.conversationId, required this.username, required this.profileImage }) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  late ConversationBloc _conversationBloc;

  @override
  void initState() {
    _conversationBloc = BlocProvider.of<ConversationBloc>(context);
    _conversationBloc.add(LoadConversationRepliesEvent(this.widget.conversationId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _conversationInfo(),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _mainUI(),
    );
  }

  Widget _conversationInfo(){
    return Row(
      children: [
        ProfileImage(image: this.widget.profileImage, size: 40),
        SizedBox(width: 10,),
        _username()
      ],
    );
  }

  Widget _username(){
    return Text(
      this.widget.username,
      style: GoogleFonts.poppins(
        color: Theme.of(context).primaryColor,
        fontSize: 22
      ) 
    );
  }

  Widget _mainUI(){
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ConversationListView()
          ),
          SendMessageTextField(),
        ],
      ),
    );
  }
}