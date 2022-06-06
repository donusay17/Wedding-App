import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final Map<String, dynamic> toEdit;
  final Function setadorDeEstado;
  final _toDoController = TextEditingController();

  EditPage(this.toEdit, this.setadorDeEstado, {Key? key}) : super(key: key) {
    this._toDoController.text = this.toEdit["title"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Page",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _toDoController,
                  decoration: InputDecoration(
                      labelText: "Edit Task",
                      labelStyle: TextStyle(color: Colors.blueGrey)),
                  maxLines: null,
                ),
              )),
          RaisedButton(
              color: Colors.blueGrey,
              child: Text("KAYDET"),
              textColor: Colors.white,
              onPressed: () {
                this.setadorDeEstado(() {
                  this.toEdit["title"] = _toDoController.text;
                  Navigator.pop(context);
                });
              }),
        ],
      ),
    );
  }
}