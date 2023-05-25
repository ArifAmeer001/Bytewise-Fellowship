import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

final calProvider = StateProvider<double>((ref) => 0.0);

void main(){
  runApp(const ProviderScope(
      child: MyApp())
  );
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calulator using Riverpod',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends ConsumerWidget{

  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final result = ref.watch(calProvider);

    TextEditingController num1Control = TextEditingController();
    TextEditingController num2Control = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator using RiverPod'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: num1Control,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number'),
            ),
            TextField(
              controller: num2Control,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Number'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.read(calProvider.notifier).state =
              (double.tryParse(num1Control.text) ?? 0) + (double.tryParse(num2Control.text) ?? 0),
              child: const Text('Add', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => ref.read(calProvider.notifier).state =
                  (double.tryParse(num1Control.text) ?? 0) - (double.tryParse(num2Control.text) ?? 0),
              child: const Text('Subtract', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => ref.read(calProvider.notifier).state =
                  (double.tryParse(num1Control.text) ?? 0) * (double.tryParse(num2Control.text) ?? 0),
              child: const Text('Multiply', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => ref.read(calProvider.notifier).state =
                  (double.tryParse(num1Control.text) ?? 0) / (double.tryParse(num2Control.text) ?? 0),
              child: const Text('Divide', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => ref.read(calProvider.notifier).state =
                  math.pow((double.tryParse(num1Control.text) ?? 0), 2).toDouble(),
              child: const Text('Square (First Number)', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => ref.read(calProvider.notifier).state =
                  math.pow((double.tryParse(num1Control.text) ?? 0), 3).toDouble(),
              child: const Text('Cube (First Number)', style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(height: 16),
            Text(
              'Result: $result',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
