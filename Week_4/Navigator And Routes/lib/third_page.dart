import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget{
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPage();
}

class _ThirdPage extends State<ThirdPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text('Third Page')
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade500,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Screen 3'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}