import 'package:flutter/material.dart';
import 'package:whatsapp_app/colors.dart';
import 'package:whatsapp_app/info.dart';
import 'package:whatsapp_app/widgets/chat_list.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(info[0]['name'].toString()
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: ChatList(),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.07,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Colors.transparent,
                  )
              ),
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: mobileChatBoxColor,
                        filled: true,
                        prefixIcon: const Icon(Icons.emoji_emotions_outlined, color: Colors.grey,),
                        suffixIcon: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.attach_file, color: Colors.grey,),
                            Icon(Icons.camera_alt, color: Colors.grey,),
                            Padding(padding: EdgeInsets.only(right: 8)),

                          ],
                        ),
                        hintText: 'Message',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none
                            )
                        ),
                        contentPadding: const EdgeInsets.only(left: 20),
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: () {},
                  icon: const Icon(Icons.mic),
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
