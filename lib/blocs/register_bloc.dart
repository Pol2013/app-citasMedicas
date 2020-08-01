import 'package:app_citas/blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators {
  final _documentNumberController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _lastNameMController = BehaviorSubject<String>();
  final _addressController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmController = BehaviorSubject<String>();

  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get documentNumberStream => _documentNumberController.stream;
  Stream<String> get lastNameStream => _lastNameController.stream;
  Stream<String> get lastNameMStream => _lastNameMController.stream;
  Stream<String> get addressStream => _addressController.stream;
  Stream<String> get phoneStream => _phoneController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get passwordConfirmStream => _passwordConfirmController.stream;

  Function(String) get changeDocumentNumber =>
      _documentNumberController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeLastName => _lastNameController.sink.add;
  Function(String) get changeLastNameM => _lastNameMController.sink.add;
  Function(String) get changeAdress => _addressController.sink.add;
  Function(String) get changePhone => _phoneController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changePasswordConfirm =>
      _passwordConfirmController.sink.add;

  String get documentNumber => _documentNumberController.value;
  String get name => _nameController.value;
  String get lastName => _lastNameController.value;
  String get lastNameM => _lastNameMController.value;
  String get address => _addressController.value;
  String get phone => _phoneController.value;
  String get email => _emailController.value;
  String get password => _passwordController.value;
  String get passwordConfirm => _passwordConfirmController.value;

  dispose() {
    _documentNumberController?.close();
    _nameController?.close();
    _lastNameController?.close();
    _lastNameMController?.close();
    _addressController?.close();
    _phoneController?.close();
    _emailController?.close();
    _passwordController?.close();
    _passwordConfirmController?.close();
  }
}
