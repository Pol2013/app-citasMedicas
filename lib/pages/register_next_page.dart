import 'package:app_citas/blocs/provider.dart';
import 'package:app_citas/blocs/register_bloc.dart';
import 'package:app_citas/providers/user_provider.dart';
import 'package:flutter/material.dart';

class RegisterNextPage extends StatelessWidget {
  final userProvider = UserProvider();

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
                  'INGRESAR SUS DATOS',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromRGBO(62, 198, 255, 1),
                      fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: 'Nacionalidad',
                  items: ['Nacionalidad', 'Perú']
                      .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                SizedBox(height: 10.0),
                _buildAddressTextField(bloc),
                SizedBox(height: 10.0),
                _buildPhoneTextField(bloc),
                SizedBox(height: 10.0),
                _buildEmailTextField(bloc),
                SizedBox(height: 10.0),
                _buildPasswordTextField(bloc),
                SizedBox(height: 10.0),
                _buildPasswordConfirmTextField(bloc),
                ButtonTheme(
                  minWidth: 400.0,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text("siguiente"),
                    onPressed: () {
                      _register(context, bloc);
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

  Widget _buildAddressTextField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField('dirección', bloc.changeAdress, snapshot);
      },
    );
  }

  Widget _buildPhoneTextField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField('celular', bloc.changePhone, snapshot,
            typeInput: TextInputType.phone);
      },
    );
  }

  Widget _buildEmailTextField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField('correo', bloc.changeEmail, snapshot,
            typeInput: TextInputType.emailAddress);
      },
    );
  }

  Widget _buildPasswordTextField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField('contraseña', bloc.changePassword, snapshot);
      },
    );
  }

  Widget _buildPasswordConfirmTextField(RegisterBloc bloc) {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField(
            'confirmar contraseña', bloc.changePasswordConfirm, snapshot);
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

  _register(BuildContext context, RegisterBloc bloc) async {
    final info = await userProvider.register(
        bloc.name,
        bloc.lastName,
        bloc.lastNameM,
        '1',
        bloc.documentNumber,
        bloc.address,
        bloc.phone,
        bloc.email,
        bloc.password,
        bloc.passwordConfirm);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'dashboard');
    } else {
      _showAlert(context, 'Error al iniciar Sesión');
    }
  }

  void _showAlert(BuildContext context, String s) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: Text(s),
        );
      },
    );
  }
}
