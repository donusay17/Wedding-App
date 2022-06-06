import 'dart:convert';
import 'dart:io';
import 'package:date_format/date_format.dart';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'aboutPage.dart';
import 'editPage.dart';
import 'theme.dart';

void main() {

  runApp(
    ChangeNotifierProvider<DynamicDarkMode>(
      create: (_) => DynamicDarkMode(),
      child: homeToDo(),
    ),
  );
}

class homeToDo extends StatefulWidget {
  @override
  _homeToDoState createState() => _homeToDoState();
}

class _homeToDoState extends State<homeToDo> {
  final _toDoController = TextEditingController();
  List<Map<String, dynamic>> _toDoList = [];

  late Map<String, dynamic> _lastRemove;
  late int _lastRemovenPos;

  static DateTime _data = new DateTime.now();
  static var dataAtual = '${formatDate(_data, [dd, '/', mm, '/', yyyy])}';
  var _dataAtual = dataAtual.toString();

  @override
  void initState() {
    super.initState();
    _readData().then((dados) {
      setState(() {
        _toDoList = List<Map<String, dynamic>>.from(json.decode(dados));
      });
    });
  }

  void _addToDo() {
    setState(() {

      Map<String, dynamic> newToDo = Map();
      newToDo["title"] = _toDoController.text;
      _toDoController.text = "";
      newToDo["ok"] = false;
      _toDoList.add(newToDo);
      newToDo["date"] = _dataAtual;
      _saveData();
    });
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _toDoList.sort((a, b) {

        if (a["ok"] && !b["ok"])
          return 1;
        else if (!a["ok"] && b["ok"])
          return -1;
        else
          return 0;
      });
    });
    return null;
  }


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text("To do List"),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.arrow_back),
                onPressed: () {
                 Navigator.pop(context);

                  setState(() {

                  });
                }),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _toDoController,
                      decoration: InputDecoration(
                          labelText: "New Task",
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      maxLines: null,
                    ),
                  ),
                  RaisedButton(
                      color: Colors.blueGrey,
                      child: Text("ADD"),
                      textColor: Colors.white,
                      onPressed: _addToDo)
                ],
              ),
            ),
            Expanded(
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 10.0),
                      itemCount: _toDoList.length,
                      itemBuilder: buildItem),
                ))
          ],
        ),
        drawer: Drawer(
          child: buildDrawer(context),
        ),
      ),
    );
  }


  Widget buildDrawer(context){
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18)),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
        ),

        ListTile(
          title: Text('Bunları Mutlaka Yap'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutPage()));
          },
        ),
      ],
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              " Edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }


  Widget buildItem(context, index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: slideRightBackground(),
      secondaryBackground: slideLeftBackground(),

      //direction: DismissDirection.endToStart,
      child: CheckboxListTile(
        activeColor: Colors.blueGrey,
        title: Text(_toDoList[index]["title"]),
        subtitle: Text(_toDoList[index]["date"]),
        //_toDoList[index]["date"]
        value: _toDoList[index]["ok"],
        secondary: CircleAvatar(
            backgroundColor: _toDoList[index]["ok"] ? Colors.green : Colors.red,
            child: Icon(
              _toDoList[index]["ok"] ? Icons.check : Icons.error,
              color: Colors.white,
            )),
        onChanged: (c) {
          setState(() {
            _toDoList[index]["ok"] = c;
            _saveData();
          });
        },
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EditPage(_toDoList[index], this.setState)));
          return false;
        } else if (direction == DismissDirection.endToStart) {

          return true;
        }
        return false;
      },

      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {

          setState(() {

            _lastRemove = Map.from(_toDoList[index]);
            _lastRemovenPos = index;
            _toDoList.removeAt(index);

            _saveData();
            final snack = SnackBar(
              content: Text("Task \"${_lastRemove["title"]}\" removed"),
              action: SnackBarAction(
                  label: "Undo",
                  onPressed: () {
                    setState(() {
                      _toDoList.insert(_lastRemovenPos, _lastRemove);
                      _saveData();
                    });
                  }),
              duration: Duration(seconds: 3),
            );
            Scaffold.of(context).removeCurrentSnackBar();
            Scaffold.of(context).showSnackBar(snack);
          });
        }
        /*
        else if(direction ==DismissDirection.startToEnd){//editar
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditPage()));
        }  */
      },
    );
    
  }

  Future<File> _getFile() async {

    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/dados.json");
  }

  Future<File> _saveData() async {
    String dados = json.encode(
        _toDoList);
    final file =
    await _getFile();
    return file
        .writeAsString(dados);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {

      return "";
    }
  }
}
