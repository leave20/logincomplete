import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:logincomplete/src/bloc/Validator.dart';


class LoginBloc with Validator {


  //Use Rx Dart
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // final _emailController = StreamController<String>.broadcast();
  // final _passwordController = StreamController<String>.broadcast();

  //Insert values to Stream
  Function(String) get changeEmail => _emailController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

//Recover input data
  Stream<String> get emailStream =>
      _emailController.stream.transform(mailValidate);

  Stream<String> get passwordStream =>
      _passwordController.stream.transform(passwordValidate);

  //Form validated
  Stream<bool> get formValidStream =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

// Obtain Last values
  String get email => _emailController.value;

  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
