import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'chat.dart';

const users=const{
  'xmuammar@gmail.com':'12345',
  'muammarsst@gmail.com':'admin',

};

class LoginScreen extends StatelessWidget{
  Duration get loginTime => Duration(microseconds: 2250);

  Future<String?> _authUser(LoginData){
    debugPrint('Name${data.name}, Password:${data.password}');
    return Future.delayed(loginTime).then((_){
      if(!users.containsKey(data.name)){
        return 'Pengguna tidak ada dalam sistem';
      }
      if(users[data.name]!=data.password){
        return 'Kata sandi tidak cocok dalam sistem';
      }
      return null;
    });
  }

  Widget build(BuildContext context){
    return FlutterLogin(
      title: 'SILAGAK',
        logo: AssetImage('assets/images/ecorp-lightblue.png'),
        onLogin: _authUser,
      onSubmitAnimationCompleted: (){
        Navigator.of(context).pushReplacementNamed(MaterialPageRoute(
            builder: context)=>MyApp())
      },
    );
  }

}