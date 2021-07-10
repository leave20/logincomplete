import 'package:flutter/material.dart';
import 'package:logincomplete/src/bloc/login_bloc.dart';
export 'package:logincomplete/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _instance;

  factory Provider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new Provider._internal(key: key, child: child);
    }
    return _instance;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  //Instance LoginBloc
  final loginBloc = LoginBloc();

  @override
  //Notify child
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  //
  static LoginBloc of(BuildContext context) {
    //return Search instance on the context the provider
    return (context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc);
  }
}
