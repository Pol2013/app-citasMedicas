import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum SingingCharacter { lafayette, jefferson }

SingingCharacter character = SingingCharacter.lafayette;

class DatosRegisterPage extends StatelessWidget {
  setState(value) {
    character = value;
  }

  static final showGrid = true;

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
              Text('Ingresar sus Datos'),
              SizedBox(height: 20.0),
              buildTextField('Dirección'),
              SizedBox(height: 20.0),
              buildTextField('Celular'),
              SizedBox(height: 20.0),
              buildTextField('Correo'),
              SizedBox(height: 20.0),
              buildTextField('Contraseña'),
              SizedBox(height: 20.0),
              buildTextField('Confirmar Contraseña'),
              SizedBox(height: 20.0),
              RadioListTile<SingingCharacter>(
                title: const Text('En Tratamiento'),
                value: SingingCharacter.lafayette,
                groupValue: character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: const Text('Familiar en Tratamiento'),
                value: SingingCharacter.jefferson,
                groupValue: character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: const Text("Otro"),
                value: SingingCharacter.jefferson,
                groupValue: character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    character = value;
                  });
                },
              ),
              Center(child: showGrid ? _buildGrid() : _buildList()),
              ButtonTheme(
                minWidth: 400.0,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text("Registrarse"),
                  onPressed: () {},
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
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

  Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      );

  Widget _buildList() => ListView(
        children: [
          _tile('Acepto Terminos y Conticiones,', "leer", Icons.theaters),
          InkWell(
            onTap: () {},
            child: Text(
              'aqui',
              style: TextStyle(color: Color.fromRGBO(62, 198, 255, 100)),
            ),
          )
        ],
      );

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
}
