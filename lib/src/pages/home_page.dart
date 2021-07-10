import 'package:flutter/material.dart';
// import 'package:logincomplete/src/bloc/Provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: _buttonCreate(context),

      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     Text('Email: ${bloc.email}'),
      //     Divider(),
      //     Text('Password: ${bloc.password}'),
      //   ],
      // ),
    );
  }

  _buttonCreate(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      child: Icon(Icons.arrow_right),
        onPressed: () => Navigator.pushNamed(context, 'product'));
  }
}
