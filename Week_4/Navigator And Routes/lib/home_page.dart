import 'package:flutter/material.dart';
import 'package:navigator_and_routes/utils/routes_name.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text('Home Page')
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.secondPage);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('Screen 1'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}