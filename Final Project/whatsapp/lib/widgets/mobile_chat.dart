import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_app/colors.dart';
import 'package:whatsapp_app/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_app/models/user_model.dart';
import 'package:whatsapp_app/widgets/chat_list.dart';

class MobileChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  const MobileChatScreen({Key? key, required this.name, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<UserModel>(
          stream: ref.read(authControllerProvider).userDataById(uid),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              return Column(
                children: [
                  Text(name),
                  Text(snapshot.data!.isOnline ? 'online' : 'offline')
                ],
              )
            }
            return Container();
          }
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
