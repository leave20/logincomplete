import 'dart:async';

class Validator {
  final mailValidate =
      StreamTransformer<String, String>.fromHandlers(handleData: (mail, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if(regExp.hasMatch(mail)) {
      sink.add(mail);
    }else{
      sink.addError('Mail is not correct');
    }

  });

  final passwordValidate = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('More than 6 characters');
    }
  });
}
