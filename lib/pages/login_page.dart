export 'package:app_citas/blocs/login_bloc.dart';
import 'package:app_citas/blocs/login_bloc.dart';
import 'package:app_citas/blocs/provider.dart';
import 'package:app_citas/pages/register_page.dart';
import 'package:app_citas/providers/user_provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FlutterLogo(
                  size: 50.0,
                ),
                SizedBox(height: 100.0),
                _buildEmailTextField(bloc),
                SizedBox(height: 20.0),
                _buildPasswordTextField(bloc),
                SizedBox(height: 20.0),
                Text('Olvide mi clave'),
                SizedBox(height: 20.0),
                _buildSignInButton(bloc),
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
                              builder: (context) => RegisterPage()),
                        );
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
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FlatButton(
              onPressed: () => {_triaje(context)},
              child: Wrap(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.touch_app,
                        color: Colors.blue,
                      ),
                      Text(
                        "Triaje",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildEmailTextField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField(
            'documento de identidad', bloc.changeEmail, snapshot,
            typeInput: TextInputType.number);
      },
    );
  }

  Widget _buildPasswordTextField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return buildTextField('clave', bloc.changePassword, snapshot,
            isPassword: true);
      },
    );
  }

  Widget _buildSignInButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ButtonTheme(
          minWidth: 400.0,
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text("ingresar"),
            onPressed: snapshot.hasData
                ? () {
                    _login(context, bloc);
                  }
                : null,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
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

  _login(BuildContext context, LoginBloc bloc) async {
    final info = await userProvider.logIn(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'dashboard');
    } else {
      _showAlert(context, 'Error al iniciar Sesión');
    }
  }

  _triaje(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'triaje');
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
