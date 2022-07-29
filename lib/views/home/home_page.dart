import 'package:flutter/material.dart';
import 'package:personal_pjt/connector/auth_connector.dart';
import 'package:personal_pjt/views/pages/UsersNoteList.dart';

// multiple connector example  uses auth_connector and todo_connector
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return AuthConnector(
      builder: (BuildContext authContext, AuthViewModel authModel) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text(
                'Home Page for ${authModel.currentUser?.email ?? 'no user'}'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  authModel.logOut;
                  Navigator.of(context).pop();
                },
              ),
              IconButton(
                icon: const Icon(Icons.notes),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return NoteList();
                  }));
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Text(
                        "Notes Application",
                        style: TextStyle(color: Colors.grey, fontSize: 28),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.3,
                      ),
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: "Enter the title",
                          label: Text("Title"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Title should not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      TextFormField(
                        controller: _descController,
                        decoration: InputDecoration(
                          hintText: "Enter the Description",
                          label: Text("Description"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Description should not be empty";
                          } else if (value.length < 10) {
                            return "Description must be atleast 10 characters in length";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                              padding: EdgeInsets.fromLTRB(25, 15, 25, 15)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final title = _titleController.text;
                              final desc = _descController.text;
                              //authModel.mailAndNotes;
                              authModel.mailAndNotes("nary2vip@gmail.com",
                                  {"title": title, "desc": desc});
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Success",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      content: Text("Note added successfully"),
                                    );
                                  });
                            }
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 16),
                          ))

                      //Text('${authModel.currentUser!.userId?.toString()}'),
                      //Text('${authModel.currentUser!.email?.toString()}'),
                      //Text("Hello"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

//single connector example

//class HomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return TodoConnector(
//      builder: (BuildContext c, TodoViewModel model) {
//        return Scaffold(
//          appBar: AppBar(
//            title: const Text('Home Page'),
//            actions: <Widget>[
//              new IconButton(
//                  icon: const Icon(Icons.file_download),
//                  onPressed: () {
//                    model.getList();
//                  }),
//            ],
//          ),
//          drawer: AppDrawer(),
//          body: ListView.builder(
//              padding: const EdgeInsets.all(16.0),
//              itemCount: model.toDoList?.length ?? 0,
//              itemBuilder: (BuildContext context, int i) {
//                return _buildRow(object: model.toDoList[i]);
//              }),
//        );
//      },
//    );
//  }
//
//  Widget _buildRow({TodoObject object}) {
//    return Card(
//      child: Container(padding: const EdgeInsets.all(5.0),child: new Text(object.title)),
//      elevation: 5.0,
//    );
//  }
//}
