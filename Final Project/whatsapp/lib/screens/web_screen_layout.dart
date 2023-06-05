import 'package:flutter/material.dart';
import 'package:whatsapp_app/colors.dart';
import 'package:whatsapp_app/widgets/chat_list.dart';
import 'package:whatsapp_app/widgets/contacts_list.dart';
import 'package:whatsapp_app/widgets/search_bar.dart';
import 'package:whatsapp_app/widgets/web_chat_appbar.dart';
import 'package:whatsapp_app/widgets/web_profile_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WebProfileBar(),
                  WebSearchBar(),
                  ContactList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.75,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgimg.png'),
                fit: BoxFit.cover
              )
            ),
            child: Column(
              children: [
                const WebChatAppBar(),
                const Expanded(
                  child: ChatList(),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.09,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: dividerColor,
                      )
                    ),
                    color: chatBarMessage,
                  ),
                  child: Row(
                    children: [
                      IconButton(onPressed: () {},
                        icon: const Icon(Icons.emoji_emotions_outlined),
                        color: Colors.grey,
                      ),
                      IconButton(onPressed: () {},
                        icon: const Icon(Icons.attach_file),
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: searchBarColor,
                              filled: true,
                              hintText: 'Message',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
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
          ),
        ],
      ),
    );
  }
}
