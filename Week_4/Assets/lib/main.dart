import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor : Colors.blueAccent,
      appBar : AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Assets'),
      ),
      body: Column(
        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(
                child: Image(
                  image: AssetImage('assets/Avatar_01.png'),
                  width: 200,
                ),
              ),
              Center(
                child: Image(
                  image: AssetImage('assets/Avatar_02.png'),
                  width: 200,
                ),
              ),
            ],
          ),
          const Center(
            child: Image(
              image: AssetImage('assets/Avatar_03.png'),
              width: 200,
            ),
          ),
        ],
      ),
    ),
  ));
}
