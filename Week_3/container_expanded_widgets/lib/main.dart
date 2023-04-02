import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super (key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text("Flutter Widgets"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.yellowAccent,
                    child: Text("Conatin1"),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.deepOrange,
                    child: Text("Conatin1"),
                  ),
                )
              ],
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(50),
                // or padding: EdgeInsets.only(
                //left: 100,
                //right: 10,
                // ),
                //margin: EdgeInsets.only(
                  //left: 30,
                //),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://images.pexels.com/photos/236970/pexels-photo-236970.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.limeAccent,
                      blurRadius: 10,
                    )
                  ],
                  border: Border.all(
                    color: Colors.cyan,
                    width: 5,
                  )
                ),
                child: const Center(child: Text("Practicing with widgets",
                style: TextStyle(
                  color: Colors.white,
                ),)),
              ),
            ),
          ],
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

  /*@override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
        ),
      ),
    );
  }*/
