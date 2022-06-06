import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  AboutPage();

  BoxDecoration _aboutBoxDecoration() {
    return BoxDecoration(
      border: Border.all(width: 1.5, color: Colors.black54),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mutlaka Yapılacaklar",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(30.0),
              padding: const EdgeInsets.all(10.0),
              decoration: _aboutBoxDecoration(),
              child: Text(
                "Bunları mutlaka yap.",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}