import 'package:bootcamp165/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class signInPage extends StatefulWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  _signInPageState createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,

          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
          body: Container(
            child: Padding(
              padding: EdgeInsets.only(left: context.dynamicWidth(0.1), right:
              context.dynamicWidth(0.1)),
              child: Column(
                children: [
                  buildLogo(),
                  Spacer(),
                  SizedBox(
                    child: buildPassword(context),
                  ),
                  Spacer(),
                  buildSignButton(), Spacer(),
                  buildTextSecond(),
                  buildTextThird(context),
                  Spacer(),
                ],
              ),
            ),
          ),
        )
    );
  }

  TextButton buildTextThird(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => LoginPage()));
        },
        child: Text(
          'Giriş Yapınız',
          style: TextStyle(color: Colors.deepOrangeAccent),
        ));
  }

  Text buildTextSecond() => Text('Hesabınız var mı?');

  ElevatedButton buildSignButton() {
    return ElevatedButton(

      onPressed: () {
        /*_authService.createPerson(_nameController.text,_mailController.text,
            _passwordController.text,_phoneController.text);
        print("name: "+_nameController.text);
        print("mail: "+_mailController.text);
        print("password: "+_passwordController.text);
        print("phone: "+_phoneController.text);*/
      },
      child: Text('Kayıt Ol'),
      style: ElevatedButton.styleFrom(
          primary: Color(0xFFFF7643),
          padding: EdgeInsets.all(10)),);
  }

  Expanded buildPassword(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            child: PhysicalModel(
              elevation: 6.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.only(left: context.dynamicHeight(0.01)),
                  child: TextField(
                    //controller: _mailController,
                      decoration: InputDecoration(
                          labelText: 'Mail',
                          labelStyle: Theme
                              .of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Color(0xFFFF7643)))),
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.dynamicHeight(0.015),
          ),
          SizedBox(
            child: PhysicalModel(
              elevation: 6.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.only(left: context.dynamicHeight(0.01)),
                  child: TextField(
                    obscureText: true,
                    //controller: _passwordController,
                    decoration: InputDecoration(
                        labelText: 'İsim Soyisim',
                        labelStyle:Theme
                            .of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Color(0xFFFF7643))),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.dynamicHeight(0.015),
          ),
          SizedBox(
            child: PhysicalModel(
              elevation: 6.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.only(left: context.dynamicHeight(0.01)),
                  child: TextField(
                    //controller: _mailController,
                      decoration: InputDecoration(
                          labelText: 'Şifre',
                          labelStyle: Theme
                              .of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Color(0xFFFF7643)))),
                ),
              ),
            ),
          ),
        ],
      ),);
  }


  Expanded buildLogo() {
    return Expanded(
      flex: 15,
      child: Container(
        child: Image.asset('assets/images/wed3.png'),
      ),
    );
  }
}

