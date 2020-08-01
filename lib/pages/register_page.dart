import 'package:app_citas/blocs/provider.dart';
import 'package:app_citas/blocs/register_bloc.dart';
import 'package:app_citas/pages/register_next_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DateTime selectedDate = DateTime.now();

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
    final bloc = Provider.registerBloc(context);

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
                    items: [
                      'Tipo de Documento',
                      'DNI',
                      'Carnét de Extrangeria',
                      'Pasaporte'
                    ]
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 10.0),
                  _buildDocumentNumberTextField(bloc),
                  SizedBox(height: 10.0),
                  _buildNameTextField(bloc),
                  SizedBox(height: 10.0),
                  _buildLastNameTextField(bloc),
                  SizedBox(height: 10.0),
                  _buildLastNameMTextField(bloc),
                  SizedBox(height: 10.0),
                  _buildDateOfBirthTextField(bloc),
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

  Widget _buildDocumentNumberTextField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField(
            'nr. documento', bloc.changeDocumentNumber, snapshot,
            typeInput: TextInputType.number);
      },
    );
  }

  Widget _buildNameTextField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField('nombre completo', bloc.changeName, snapshot);
      },
    );
  }

  Widget _buildLastNameTextField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField(
            'apellido paterno', bloc.changeLastName, snapshot);
      },
    );
  }

  Widget _buildLastNameMTextField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField(
            'apellido materno', bloc.changeLastNameM, snapshot);
      },
    );
  }

  Widget _buildDateOfBirthTextField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'FECHA DE NACIMIENTO',
            errorText: snapshot.error,
          ),
          onTap: () {
            _selectDate(context);
          },
        );
      },
    );
  }

  Widget buildTextField(String inputText, Function fu, AsyncSnapshot snapshot,
      {isPassword = false, typeInput = TextInputType.text}) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: inputText.toUpperCase(),
        errorText: snapshot.error,
      ),
      onChanged: fu,
      obscureText: isPassword,
      keyboardType: typeInput,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(Duration(days: 365 * 18)),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
