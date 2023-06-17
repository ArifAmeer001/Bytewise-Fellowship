import 'package:flutter/material.dart';
import 'package:whatsapp_app/colors.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({
    super.key,
  });

  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField>{
  bool isShowSendButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: TextFormField(
              onChanged: (val){
                if(val.isNotEmpty){
                  setState(() {
                    isShowSendButton = true;
                  });
                }
                else{
                  setState(() {
                    isShowSendButton = false;
                  });
                }
              },
              decoration: InputDecoration(
                fillColor: mobileChatBoxColor,
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                              icon:const Icon(Icons.emoji_emotions_outlined, color: Colors.grey,)
                          ),
                          // Icon(Icons.gif, color: Colors.grey,)
                        ],
                      )
                  ),
                ),
                suffixIcon: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.attach_file, color: Colors.grey,)
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt, color: Colors.grey,),
                      ),
                    ],
                  ),
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
          // IconButton(onPressed: () {},
          //   icon: const Icon(Icons.mic),
          //   color: Colors.grey,
          // ),
           Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
              right: 2,
              left: 2,
            ),
            child: CircleAvatar(
              backgroundColor: const Color(0xFF128C7E),
              radius: 25,
              child: Icon(
                isShowSendButton ? Icons.send : Icons.mic,
                color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}

