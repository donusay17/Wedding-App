import 'package:bootcamp165/screens/splash/components/openingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class guestPage extends StatefulWidget {
  const guestPage({Key? key}) : super(key: key);

  @override
  State<guestPage> createState() => _guestPageState();
}

class _guestPageState extends State<guestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("DÜĞÜNÜM VAR",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
     backgroundColor: Colors.white,

      body: Center(child: Text("COMING SOON",style: TextStyle(fontSize: 40,
          color: Colors.orangeAccent),
      ),),
    );

  }
}
