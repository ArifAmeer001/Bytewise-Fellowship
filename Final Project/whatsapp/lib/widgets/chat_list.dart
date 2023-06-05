import 'package:flutter/material.dart';
import 'package:whatsapp_app/info.dart';
import 'package:whatsapp_app/widgets/my_message_card.dart';
import 'package:whatsapp_app/widgets/sender_message_card.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index){
        if(messages[index]['isMe'] == true)
          {
            return MyMessageCard(message: messages[index]['text'].toString(),
                date: messages[index]['time'].toString());
          }
        else{
          return SenderMessageCard(message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString());
        }
      },
    );
  }
}
