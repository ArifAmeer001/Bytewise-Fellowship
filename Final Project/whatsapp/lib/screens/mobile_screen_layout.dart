import 'package:flutter/material.dart';
import 'package:whatsapp_app/colors.dart';
import 'package:whatsapp_app/widgets/contacts_list.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Whatsapp',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 28
            )
          ),
          centerTitle: false,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.grey,)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.grey,)),
          ],
          bottom: const TabBar(
            indicatorWeight: 4,
            indicatorColor: tabColor,
            labelColor: tabColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle( fontWeight: FontWeight.bold),
            tabs: [
              Text('CHATS'),
              Text('STATUS'),
              Text('CALLS')
            ],
          ),
        ),
        body: const ContactList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: tabColor,
          child: const Icon(
            Icons.comment,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
