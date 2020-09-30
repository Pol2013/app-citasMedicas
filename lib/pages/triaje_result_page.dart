import 'package:flutter/material.dart';

class TriajeResultPage extends StatefulWidget {
  @override
  _TriajeResultPageState createState() => _TriajeResultPageState();
}

class _TriajeResultPageState extends State<TriajeResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Triage'),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 50.0),
          Text(
            'Triaje',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 80.0),
        ]),
      ),
    );
  }
}
