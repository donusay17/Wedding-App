import 'package:bootcamp165/bottomBarHomePage.dart';
import 'package:bootcamp165/extensions/context_extensions.dart';
import 'package:bootcamp165/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildBodyContainer(context),
    );
  }

  Container buildBodyContainer(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Spacer(),
          buildLogo(),
          Spacer(
            flex: 1,
          ),
          buildTextFieldMail(context),
          Row(
            children: [
              Spacer(),
              Text('Hesabınız Yok mu?'),
              buildSignInButton(context),
              Spacer(),
              buildForgotPasswordButton(),
              Spacer(),
            ],
          ),
          buildLoginButton(),
          Spacer(),
        ],
      ),
    );
  }
  Align buildLoginButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  bottomBarHomePage()),
          );
          /*_authService
              .signIn(_mailController.text, _passwordController.text)
              .then((value) {

            Fluttertoast.showToast(
              msg: "Giriş Başarılı...", // message
              toastLength: Toast.LENGTH_SHORT, // length
              gravity: ToastGravity.BOTTOM, // location
              // duration
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  homePage()),
            );

          });*/
        },
        child: Icon(
          Icons.arrow_forward_rounded,
          color: Colors.black,
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: CircleBorder(),
            padding: EdgeInsets.all(12)),
      ),
    );
  }
  TextButton buildForgotPasswordButton() {
    return TextButton(
        onPressed: () {},
        child: Text(
          'Şifrenizi mi '
              'unuttunuz?',
          style: TextStyle(color: Colors.black),
        ));
  }
  TextButton buildSignInButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => signInPage()));
        },
        child: Text(
          'Kaydolun',
          style: TextStyle(color: Colors.black),
        ));
  }
  Padding buildTextFieldMail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.dynamicWidth(0.10), right: context.dynamicWidth(0.10)),
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
                        labelText: 'Şifre',
                        labelStyle: Theme
                            .of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: Color(0xFFFF7643))),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
    );
  }
  Expanded buildLogo() {
    return Expanded(
      flex: 15,
      child: Container(
        child: Image.asset('assets/images/wed2.png'),
      ),
    );
  }
}

