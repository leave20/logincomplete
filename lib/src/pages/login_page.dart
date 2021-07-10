import 'package:flutter/material.dart';
import 'package:logincomplete/src/bloc/Provider.dart';
import 'package:logincomplete/src/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  //Custom button
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.deepPurple,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
    elevation: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[_backgroundCreate(context), _loginForm(context)],
      ),
    );
  }

  Widget _backgroundCreate(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final backgroundPurple = Container(
      height: size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(60, 60, 160, 1.0),
        Color.fromRGBO(90, 70, 180, 1.0),
        Color.fromRGBO(60, 60, 160, 1.0)
      ])),
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        backgroundPurple,
        Positioned(top: 50.0, left: 30.0, child: circle),
        Positioned(top: 5.0, right: -25.0, child: circle),
        Container(
          padding: EdgeInsets.only(top: 25.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(height: 10.0, width: double.infinity),
              Text(
                'Craig Kem',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _loginForm(context) {
    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 200.0,
            ),
          ),
          Container(
              width: size.width * 0.85,
              margin: EdgeInsets.symmetric(vertical: 30.0),
              padding: EdgeInsets.symmetric(vertical: 50.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 3.0,
                        offset: Offset(0.0, 5.0),
                        spreadRadius: 3.0)
                  ]),
              child: Column(
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 30.0),
                  _createMail(bloc),
                  SizedBox(height: 30.0),
                  _createPassword(bloc),
                  SizedBox(height: 30.0),
                  _createButton(bloc)
                ],
              )),
          Text('Please, write your password'),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _createMail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: TextField(
            cursorColor: Colors.deepPurple,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.alternate_email,
                color: Colors.deepPurpleAccent,
              ),
              hintText: 'example@gmail.com',
              labelText: 'E-mail ',
              // counterText: snapshot.data,
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _createPassword(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              cursorColor: Colors.deepPurple,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.lock_outline,
                  color: Colors.deepPurpleAccent,
                ),
                hintText: '',
                labelText: 'Password ',
                // counterText: snapshot.data,
                errorText: snapshot.error,
              ),
              onChanged: bloc.changePassword,
            ),
          );
        });
  }

  Widget _createButton(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.formValidStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ElevatedButton(
            style: raisedButtonStyle,
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text('Access'),
            ),
          );
        });
  }

  _login(LoginBloc bloc, BuildContext context) {
    print('==============');
    print('E-mail:${bloc.email} ');
    print('==============');
    print('Password:${bloc.password}');
    print('==============');
    
    Navigator.pushReplacementNamed(context, 'home');
    
  }
}
