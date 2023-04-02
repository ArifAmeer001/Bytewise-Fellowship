import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(180, 18, 140, 126),
          title: const Text('Whats app'),
          actions: <Widget>[
            Row(
              children: [
                IconButton(
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  onPressed: (){},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                  onPressed: (){},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.menu_outlined,
                    color: Colors.white,
                  ),
                  onPressed: (){},
                ),
              ],
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size(50, 25),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text('Chats', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text('Status', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text('Calls', style: TextStyle(color: Colors.white),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
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
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: const Color.fromARGB(180, 18, 140, 126),
          child: const Icon(Icons.message_outlined, ),
        ),
      ),

      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
