import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personal_pjt/connector/auth_connector.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  void fetchUserNotes() async {}

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
        builder: (BuildContext authContext, AuthViewModel authModel) {
      return Scaffold(
        body: SafeArea(
          child: (authModel.getUserNotes.userNotes?.length == 0)
              ? Text("No Lists available")
              : SingleChildScrollView(
                  child: Text(authModel.getUserNotes.userNotes?[0]["title"])
                  // ListView.builder(
                  //   itemCount: authModel.getUserNotes.userNotes?.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return ListTile(
                  //       title: Text(
                  //           authModel.getUserNotes.userNotes![index]["title"]),
                  //     );
                  //   },
                  // ),
                  ),
        ),
      );
    });
  }
}
