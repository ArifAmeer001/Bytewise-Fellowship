import 'package:flutter/material.dart';
import 'package:navigator_and_routes/utils/routes_name.dart';

class SecondPage extends StatefulWidget{
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text('Second Page')
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.thirdPage);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Screen 2'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}