import 'dart:async';

class Validators {
  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 3) {
        sink.add(password);
      } else {
        sink.addError('La clave debe ser mayor a 3 carácteres');
      }
    },
  );
}
