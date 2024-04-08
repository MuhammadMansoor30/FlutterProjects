import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  String messageText;
  String sender;
  bool isMe;

  MessageBubble({required this.messageText, required this.sender, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end :CrossAxisAlignment.start ,
        children: [
          Text(
            sender,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 12.0
            ),
          ),
          SizedBox(
            height: 3.0,
          ),
          Material(
            color: isMe ? Colors.deepOrangeAccent : Colors.grey.shade200,
            borderRadius: isMe ? BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)
            ): BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                messageText,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.grey.shade900,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}