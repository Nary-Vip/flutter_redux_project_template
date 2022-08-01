import 'package:flutter/material.dart';
import 'package:personal_pjt/connector/auth_connector.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  void fetchUserNotes(AuthViewModel model) async {
    print(model.usrNoteList);
    //xmodel.getUserNotes(model.);
    //print(model.getUserNotes.userNotes);
  }

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
        builder: (BuildContext authContext, AuthViewModel authModel) {
      return Scaffold(
        body: SafeArea(
          child: Expanded(
            child: (authModel.usrNoteList!.userNotes!.length == 0)
                ? Text("No Lists available")
                : ListView.builder(
                    itemCount: authModel.usrNoteList!.userNotes!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                            "${authModel.usrNoteList!.userNotes![index].title}"),
                      );
                    },
                  ),
          ),
        ),
      );
    });
  }
}
