import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notetakingapp/database.dart';
import 'package:notetakingapp/page/notestile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'dialogbox.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _myBox = Hive.box('mybox');
  NoteDataBase db = NoteDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("NOTES") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();
  final _notescontroller = TextEditingController();
  void saveNewTask() {
    setState(() {
      db.notes.add([_controller.text, _notescontroller.text]);
    });
    Navigator.of(context).pop();
    db.updateDataBase();
    _controller.clear();
    _notescontroller.clear();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          notescontroller: _notescontroller,
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.notes.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Color.fromARGB(255, 228, 219, 217),
      appBar: AppBar(
        title: const Text("My Notes"),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: db.notes.length,
          itemBuilder: (context, index) {
            return Notetile(
              titleName: db.notes[index][0],
              notess1: db.notes[index][1],
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
