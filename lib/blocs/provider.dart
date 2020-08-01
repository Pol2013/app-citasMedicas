import 'package:app_citas/blocs/login_bloc.dart';
import 'package:app_citas/blocs/register_bloc.dart';
import 'package:flutter/cupertino.dart';

class Provider extends InheritedWidget {
  final loginBloc = LoginBloc();
  final _registerBloc = RegisterBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

  static RegisterBloc registerBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._registerBloc;
  }
}
