import 'package:hive_flutter/hive_flutter.dart';

class NoteDataBase {
  List notes = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    notes = [
      ["first note ", "this is my first note "],
    ];
  }

  // load the data from database
  void loadData() {
    notes = _myBox.get("NOTES");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("NOTES", notes);
  }
}
