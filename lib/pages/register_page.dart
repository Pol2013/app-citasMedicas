import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
enum SingingCharacter { lafayette, jefferson }

SingingCharacter character = SingingCharacter.lafayette;

class RegisterPage extends  StatelessWidget{

      setState(value) {
     character = value;
    }

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
              Text('Datos Personales'),
              SizedBox(height: 20.0),
              buildTextField('N de Documento'),
              SizedBox(height: 20.0),
              buildTextField('Nombre Completo'),
              SizedBox(height: 20.0),
              buildTextField('Apellido Paterno'),
              SizedBox(height: 20.0),
              buildTextField('Apellido Materno'),
              SizedBox(height: 20.0),
              buildTextField('Fecha de Nacimiento'),
              SizedBox(height: 20.0),
             RadioListTile<SingingCharacter>( 
               title: const Text('Masculino'),
               value: SingingCharacter.lafayette,
               groupValue: character,
               onChanged: (SingingCharacter value) { setState(() { character = value; }); },
             ),
              RadioListTile<SingingCharacter>( 
               title: const Text('Femenino'),
               value: SingingCharacter.jefferson,
               groupValue: character,
               onChanged: (SingingCharacter value) { setState(() { character = value; }); },
             ),
              ButtonTheme(
                minWidth: 400.0,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text("Siguiente"),
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
