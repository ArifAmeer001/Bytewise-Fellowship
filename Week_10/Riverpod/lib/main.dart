import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the counter provider
final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Counter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the counter value using the counter provider
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding:EdgeInsets.all(15)),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).state++,
            child: const Icon(Icons.add),
          ),
          const Padding(padding:EdgeInsets.all(15)),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).state--,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

// class MyApp extends StatelessWidget{
//   const MyApp({Key? key}) : super(key: key);
//
// final result = 'reslut';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Calcultor',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Calculator'),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [
//             const Padding(padding: EdgeInsets.all(5)),
//             TextField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               // maxLength: 20,
//             ),
//             const Padding(padding: EdgeInsets.all(5)),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => {},
//                   style: ElevatedButton.styleFrom(
//                     shape: const CircleBorder(),
//                   ),
//                   child: const Text('x'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => {},
//                   style: ElevatedButton.styleFrom(
//                     shape: const CircleBorder(),
//                   ),
//                   child: const Text('/'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => {},
//                   style: ElevatedButton.styleFrom(
//                     shape: const CircleBorder(),
//                   ),
//                   child: const Text('-'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => {},
//                   style: ElevatedButton.styleFrom(
//                     shape: const CircleBorder(),
//                   ),
//                   child: const Text('+'),
//                 ),
//               ],
//             ),
//             const Padding(padding: EdgeInsets.all(5)),
//             Text(result, style: const TextStyle(fontSize: 50),)
//           ],
//         ),
//       ),
//     );
//   }
// }