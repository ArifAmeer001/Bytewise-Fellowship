import 'package:flutter/material.dart';
import 'package:whatsapp_app/colors.dart';

class WebProfileBar extends StatelessWidget {
  const WebProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.09,
      width: MediaQuery.of(context).size.width*0.25,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: dividerColor,
          )
        ),
        color: webAppBarColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1619194617062-5a61b9c6a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',),
              radius: 20,
            ),
            Row(
              children: [
                IconButton(onPressed:() {}, icon: const Icon(Icons.message)),
                IconButton(onPressed:() {}, icon: const Icon(Icons.more_vert))
              ],
            )
          ],
        ),
      ),
    );
  }
}
