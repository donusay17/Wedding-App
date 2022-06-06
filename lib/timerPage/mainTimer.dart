import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:custom_timer/custom_timer.dart';

import 'view timer.dart';

void main() {
  runApp(const mainTimers(title: 'DÜĞÜNÜM VAR',));
}



class mainTimers extends StatefulWidget {
  const mainTimers({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<mainTimers> createState() => _mainTimersState();
}

class _mainTimersState extends State<mainTimers> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("DÜĞÜNÜM VAR",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){
          
          Navigator.pop(context);
        },),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat('dd/MM/yyyy HH:mm').format(_selectedDate),
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: _selectedDate.add(
                    const Duration(days: 5000),
                  ),
                ).then((value) {
                  setState(() {
                    _selectedDate = value!;
                  });
                });
              },
              child: const Text('Tarih Seçin'),
            ),
            OutlinedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
                ).then((value) {
                  setState(() {
                    _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day, value?.hour ?? 0, value?.minute ?? 0);
                  });
                });
              },
              child: const Text('Saati Seçin'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewTimerPage(date: _selectedDate)));
              },
              child: const Text('Sayacı Göster'),
            ),
          ],
        ),
      ),

    );
  }
}


