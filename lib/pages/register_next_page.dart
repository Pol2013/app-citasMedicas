import 'package:app_citas/pages/dashboad_page.dart';
import 'package:flutter/material.dart';

class RegisterNextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'INGRESAR SUS DATOS',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromRGBO(62, 198, 255, 1),
                      fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: 'Nacionalidad',
                  items: ['Nacionalidad', 'a', 'c']
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                SizedBox(height: 10.0),
                buildTextField('dirección'),
                SizedBox(height: 10.0),
                buildTextField('celular'),
                SizedBox(height: 10.0),
                buildTextField('correo'),
                SizedBox(height: 10.0),
                buildTextField('contraseña'),
                SizedBox(height: 10.0),
                buildTextField('confirmar contraseña'),
                ButtonTheme(
                  minWidth: 400.0,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text("siguiente"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashBoardPage()),
                      );
                    },
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
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
        ));
  }
}
