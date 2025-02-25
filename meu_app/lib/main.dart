import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Color Changer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorChangerScreen(),
    );
  }
}

class ColorChangerScreen extends StatefulWidget {
  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  Color _backgroundColor = Colors.white;

  void _changeColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  void _changeToRandomColor() {
    final Random random = Random();
    final Color randomColor = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
    setState(() {
      _backgroundColor = randomColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Changer'),
      ),
      backgroundColor: _backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _changeColor(Colors.red),
              child: Text('Vermelho'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Corrigido
                foregroundColor: Colors.white, // Corrigido
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _changeColor(Colors.blue),
              child: Text('Azul'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Corrigido
                foregroundColor: Colors.white, // Corrigido
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeToRandomColor,
              child: Text('Cor Aleatória'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Corrigido
                foregroundColor: Colors.white, // Corrigido
              ),
            ),
          ],
        ),
      ),
    );
  }
}