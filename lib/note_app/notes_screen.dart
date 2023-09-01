import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_23_g2/note_app/hive_helper.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final _noteController = TextEditingController();

  @override
  void initState() {
    HiveHelper.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _noteController.clear();
          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Add your note"),
                content: TextFormField(
                  controller: _noteController,
                ),
                actions: [
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      if (_noteController.text.isNotEmpty) {
                        // HiveHelper.notesList.add(_noteController.text);
                        HiveHelper.addNote(_noteController.text);
                        Navigator.pop(context);
                        setState(() {});
                      }
                    },
                  ),
                  TextButton(
                    child: Text("CANCEL"),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {});
                    },
                  ),
                ],
              );
              ;
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: HiveHelper.notesList.length,
          itemBuilder: (context, index) => Stack(
                children: [
                  InkWell(
                    onTap: () async {
                      _noteController.text = HiveHelper.notesList[index];
                      AlertDialog alert = AlertDialog(
                        title: Text("Add your note"),
                        content: TextFormField(
                          controller: _noteController,
                        ),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              if (_noteController.text.isNotEmpty) {
                                HiveHelper.updateNote(
                                    index, _noteController.text);
                                Navigator.pop(context);
                                setState(() {});
                              }
                            },
                          ),
                          TextButton(
                            child: Text("CANCEL"),
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {});
                            },
                          ),
                        ],
                      );

                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index % 2 == 1
                              ? Colors.red.withOpacity(.5)
                              : Colors.blue.withOpacity(.5)),
                      child: Center(
                          child: Text(
                        HiveHelper.notesList[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      HiveHelper.removeNote(index);
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Notes",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      actions: [
        _buildActionButtons(icon: Icons.search,onTap: ()async{
          await launchUrlString("https:www.facebook.com",mode: LaunchMode.inAppWebView);
        }),
        _buildActionButtons(
            icon: CupertinoIcons.delete,
            onTap: () {
              HiveHelper.removeAllNotes();
              setState(() {});
            }),

        _buildActionButtons(
            icon: CupertinoIcons.phone,
            onTap: ()async {

            }),
      ],
    );
  }

  Widget _buildActionButtons({required IconData icon, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
          padding: EdgeInsets.all(16),
          child: Icon(icon)),
    );
  }
}
