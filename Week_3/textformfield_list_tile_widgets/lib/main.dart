import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
        appBar: AppBar(
        title: const Text('Text Field, List Tile & List view builder widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
           Expanded(
             flex: 6,
             child: ListView.builder(
             itemCount: 15,
               itemBuilder: (context, count){
               return const ListTile(
                 leading: CircleAvatar(
                   //radius: 75,
                   backgroundImage: NetworkImage('https://images.pexels.com/photos/2340978/pexels-photo-2340978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                   ),
                 ),

                 title: Text('Arif Ameer'),
                 subtitle: Text('Hey Everyone!'),
                 trailing: Text('3:11 AM'),

               );
               }
           ),
           ),
            Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              setState(() {
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone_android),
                        icon: Icon(Icons.person),
                        labelText: 'Search Context',
                        hintText: 'Name',
                        //icon: Icon(Icons.plus_one),
                        //labelText: 'email@abc.com',
                        //hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 15, color: Colors.white10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3),

                        )
                    ),
                  ),
                );
              });
            },
            child: const Icon(Icons.search),
          ),
        ),
    );
  }
}
