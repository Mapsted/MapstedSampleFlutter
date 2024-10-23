import 'package:flutter/material.dart';
import 'package:mapsted_flutter/mapsted_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final MapstedFlutter mapsted = MapstedFlutter();

  Future<void> launchMapActivity() async {
    try {
      await mapsted.launchMapActivity();
    } catch (e) {
      print('Error launching map activity: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapsted Plugin Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: launchMapActivity,
          child: const Text("Launch Map"),
        ),
      ),
    );
  }
}
