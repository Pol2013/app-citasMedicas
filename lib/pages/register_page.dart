import 'package:app_citas/pages/register_next_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  // Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

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
                    'DATOS PERSONALES',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromRGBO(62, 198, 255, 1),
                        fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonFormField<String>(
                    value: 'Tipo de Documento',
                    items: ['Tipo de Documento', 'a', 'c']
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 10.0),
                  buildTextField('nr. documento'),
                  SizedBox(height: 10.0),
                  buildTextField('nombre completo'),
                  SizedBox(height: 10.0),
                  buildTextField('apellido paterno'),
                  SizedBox(height: 10.0),
                  buildTextField('apellido materno'),
                  SizedBox(height: 10.0),
                  buildTextField('fecha de nacimiento'),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: selectedRadio,
                        onChanged: setSelectedRadio,
                      ),
                      new Text(
                        'Masculino',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: setSelectedRadio,
                      ),
                      new Text(
                        'Femenino',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
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
                              builder: (context) => RegisterNextPage()),
                        );
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ],
              ),
            ))));
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
