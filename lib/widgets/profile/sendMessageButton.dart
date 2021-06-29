import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SendMessageButton extends StatefulWidget {
  const SendMessageButton({ Key? key }) : super(key: key);

  @override
  _SendMessageButtonState createState() => _SendMessageButtonState();
}

class _SendMessageButtonState extends State<SendMessageButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        padding: kIsWeb ? EdgeInsets.fromLTRB(10, 16, 0, 16) : EdgeInsets.all(10.0), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buttonText(),
          SizedBox(width: 10,),
          _buttonIcon()
        ],
      ),
      onPressed: (){}
    );
  }

  Widget _buttonText(){
    return Text(
      "Send message",
      style: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 14
      ),
    );
  }

  Widget _buttonIcon(){
    return Icon(
      Icons.send,
      color: Colors.black,
    );
  }
}