import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stacks, Circle Avatar, SizedBox, Divider & Rich Text widgets'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            const SizedBox(
              height: 50,
              child: Text('Some Content'),
            ),
            const Divider(
              color: Colors.black,
              thickness: 3,
            ),
            const SizedBox(
              height: 50,
              child: VerticalDivider(
                color: Colors.black12,
                thickness: 2,
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 3,
            ),
            const Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.indigo,
                backgroundImage: NetworkImage('https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=600'),
              ),
            ),
            RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'Hey!', style: TextStyle(fontWeight: FontWeight.normal)),
                    TextSpan(text: 'Everyone.', style: TextStyle(fontWeight: FontWeight.bold))
                  ]
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      width: 100,
                      color: Colors.limeAccent,
                      child: const Text("Stack Container 1"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 150,
                      color: Colors.indigoAccent,
                      child: const Text("Stack Container 2"),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      title: 'Stack & circular widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

