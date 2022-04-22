import 'package:flutter/material.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SemicircularIndicator(
              color: Colors.orange,
              bottomPadding: 0,
              child: Text(
                '75%',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange),
              ),
            ),
            SizedBox(height: 50),
            SemicircularIndicator(
              strokeCap: StrokeCap.square,
              color: Colors.blueAccent,
              bottomPadding: 0,
              child: Text(
                '75%',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent),
              ),
            ),
            SizedBox(height: 50),
            SemicircularIndicator(
              radius: 100,
              color: Colors.yellow,
              backgroundColor: Colors.orange,
              strokeWidth: 13,
              bottomPadding: 0,
              child: Text(
                '75%',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
