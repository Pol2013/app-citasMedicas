import 'package:app_citas/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Placeholder(
                fallbackWidth: 50.0,
                fallbackHeight: 50.0,
              ),
              SizedBox(height: 100.0),
              buildTextField('documento de identidad'),
              SizedBox(height: 20.0),
              buildTextField('clave'),
              SizedBox(height: 20.0),
              Text('Olvide mi clave'),
              SizedBox(height: 20.0),
              ButtonTheme(
                minWidth: 400.0,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text("ingresar"),
                  onPressed: () {},
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Si no esta registrado, ingrese '),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      'aqui',
                      style:
                          TextStyle(color: Color.fromRGBO(62, 198, 255, 100)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField(String inputText) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: inputText.toUpperCase(),
      ),
    );
  }
}
