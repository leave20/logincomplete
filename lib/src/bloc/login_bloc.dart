import 'dart:async';

import 'package:logincomplete/src/bloc/Validator.dart';

class LoginBloc with Validator {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Insert values to Stream

  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

//Recover input data
  Stream<String> get emailStream =>
      _emailController.stream.transform(mailValidate);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidate);

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
