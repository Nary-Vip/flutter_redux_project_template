import 'package:flutter/material.dart';
import 'package:personal_pjt/connector/auth_connector.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return AuthConnector(
        builder: (BuildContext authContext, AuthViewModel authModel) {
      return Scaffold(
        body: SafeArea(
          child: Expanded(
            child: (authModel.usrNoteList!.noteId == null)
                ? Text("No Lists available")
                : Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Center(
                            child: Text(
                              "Your Notes",
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  color: Colors.purpleAccent,
                                  elevation: 5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Note Id: ${authModel.usrNoteList!.noteId}",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Title : ${authModel.usrNoteList!.title}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Status : ${authModel.usrNoteList!.completed}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          authModel.getUserNotes("del");
                                        },
                                        icon: Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      );
    });
  }
}
