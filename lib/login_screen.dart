import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'chat.dart';

const users = const {
  'xmuammar@gmail.com': '12345',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Pengguna Tidak Tersedia';
      }
      if (users[data.name] != data.password) {
        return 'Kata Sandi Tidak cocok';
      }
      return null;
    });
  }



  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Pengguna Tidak Tersedia';
      }

      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'SILAGAK',
      logo: AssetImage('assets/images/logo.jpg'),
      onLogin: _authUser,

      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Chat(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}