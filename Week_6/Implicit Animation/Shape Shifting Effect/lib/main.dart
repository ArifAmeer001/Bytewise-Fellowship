import 'dart:math';
import 'package:flutter/material.dart';

const _duration = Duration(milliseconds: 400);

double randomBorderRadius(){
  return Random().nextDouble()*64;
}

double randomMargin(){
  return Random().nextDouble()*64;
}

Color randomColor(){
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedConatinerDemo extends StatefulWidget{
  const AnimatedConatinerDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedConatinerDemo> createState() => _AnimatedConatinerDemo();
}

class _AnimatedConatinerDemo extends State<AnimatedConatinerDemo>{
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: AnimatedContainer(
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                duration: _duration,
                curve: Curves.easeInBack,
              ),
            ),
            ElevatedButton(
              child: const Text('Change'),
              onPressed: () => change(),
            )
          ],
        ),
      ),
    );
  }
  void change(){
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedConatinerDemo(),
    );
  }
}

void main() => runApp(const MyApp());