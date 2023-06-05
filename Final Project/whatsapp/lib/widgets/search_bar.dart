import 'package:flutter/material.dart';
import 'package:whatsapp_app/colors.dart';

class WebSearchBar extends StatelessWidget {
  const WebSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.075,
      width: MediaQuery.of(context).size.width*0.25,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide( color: dividerColor),
        )
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: searchBarColor,
            prefix: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.search, size: 15,),
            ),
            hintText: 'Search or start a new contact',
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none
            )
          ),
          contentPadding: const EdgeInsets.all(10)
        ),
      ),
    );
  }
}
