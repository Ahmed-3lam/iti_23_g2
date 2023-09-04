import 'package:hive/hive.dart';

class HiveHelper {
  static const notesBox = "NOTE_BOX";
  static const notesBoxKey = "NOTE_BOX_KEY";
  static const myToken = "TOKEN";

  static var myBox = Hive.box(notesBox);
  static var myTokenBox = Hive.box(myToken);
  static List<String> notesList = [];

  static void addNote(String text) async {
    notesList.add(text);
    await myBox.put(notesBoxKey, notesList);
  }

  static Future<void> getNotes() async {
    if (myBox.isNotEmpty) {
      await Future.delayed(Duration(seconds: 3))
          .then((value) => notesList = myBox.get(notesBoxKey));
    }
  }

  static void removeNote(int index) async {
    notesList.removeAt(index);
    await myBox.put(notesBoxKey, notesList);
  }

  static void removeAllNotes() async {
    notesList.clear();
    await myBox.put(notesBoxKey, notesList);
  }

  static Future<void> updateNote(int index, String text) async {
    await Future.delayed((Duration(seconds: 5))).then((value) {
      notesList[index] = text;
      myBox.put(notesBoxKey, notesList);
    });
  }

  static setToken(String token) async {
    await myTokenBox.put(myToken, token);
  }

  static  String getToken() {
    if(myTokenBox.isNotEmpty   ){

      return myTokenBox.get(myToken);
    }else{
      return "";
    }

  }
}
