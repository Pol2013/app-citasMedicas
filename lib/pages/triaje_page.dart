import 'package:flutter/material.dart';

import 'dashboad_page.dart';

class TriajePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: _home(context),
    );
  }

  Widget _home(BuildContext context) {
    return Column(
      children: <Widget>[
        FlutterLogo(
          size: 50.0,
        ),
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
        Text('Lorem ipsum dolor sit amet, consectetur adipiscing imperdiet'),
        SizedBox(
          height: 20.0,
        ),
        ButtonTheme(
          minWidth: 400.0,
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text("Iniciar Triaje"),
            onPressed: () {},
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
        ),
      ],
    );
  }
}
