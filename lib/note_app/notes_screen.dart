import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_23_g2/note_app/hive_helper.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'cubit/note_cubit.dart';

class NotesScreen extends StatelessWidget {
  NotesScreen({super.key});

  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();
    return Scaffold(
      appBar: _buildAppBar(cubit),
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
                        cubit.addNote(_noteController.text);
                        Navigator.pop(context);
                      }
                    },
                  ),
                  TextButton(
                    child: Text("CANCEL"),
                    onPressed: () {
                      Navigator.pop(context);
                      // setState(() {});
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
      body: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is NoteLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NoteError) {
            return Center(
              child: Text(
                "ERRor",
                style: TextStyle(fontSize: 50),
              ),
            );
          }
          return ListView.builder(
              itemCount: HiveHelper.notesList.length,
              itemBuilder: (context, index) => Stack(
                    children: [
                      BlocBuilder<NoteCubit, NoteState>(
                        builder: (context, state) {
                          if (state is SingleNoteLoading &&
                              cubit.updateIndex == index) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return InkWell(
                            onTap: () async {
                              _noteController.text =
                                  HiveHelper.notesList[index];
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
                                        cubit.updateIndex = index;
                                        cubit.updateNote(
                                            index, _noteController.text);
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                  TextButton(
                                    child: Text("CANCEL"),
                                    onPressed: () {
                                      Navigator.pop(context);
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
                          );
                        },
                      ),
                      InkWell(
                        onTap: () {
                          cubit.removeNote(index);
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
                  ));
        },
      ),
    );
  }

  AppBar _buildAppBar(NoteCubit cubit) {
    return AppBar(
      title: Text(
        "Notes",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      actions: [
        _buildActionButtons(
            icon: Icons.search,
            onTap: () async {
              await launchUrlString("https:www.facebook.com",
                  mode: LaunchMode.inAppWebView);
            }),
        _buildActionButtons(
            icon: CupertinoIcons.delete,
            onTap: () {
              cubit.removeAllNotes();
            }),
        _buildActionButtons(icon: CupertinoIcons.phone, onTap: () async {}),
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
