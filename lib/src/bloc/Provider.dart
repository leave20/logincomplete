import 'package:flutter/material.dart';
import 'package:logincomplete/src/bloc/login_bloc.dart';
export 'package:logincomplete/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {

  //Instance LoginBloc
  final loginBloc = LoginBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  //Notify child
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  //
  static LoginBloc of(BuildContext context) {
    //return Search instance on the context the provider
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }
}
