import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_pjt/connector/auth_connector.dart';
import 'package:personal_pjt/views/pages/UsersNoteList.dart';

// multiple connector example  uses auth_connector and todo_connector
class HomePage extends StatelessWidget {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _authorAge = TextEditingController();
  final TextEditingController _authorLastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
      builder: (BuildContext authContext, AuthViewModel authModel) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            title: Text('Book Management',
                style: GoogleFonts.adventPro(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24))),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout_rounded),
                onPressed: () {
                  authModel.logOut;
                  Navigator.of(context).pop();
                },
              ),
              IconButton(
                icon: const Icon(Icons.note_alt_outlined),
                onPressed: () {
                  authModel.fetchBooksForTheUsers(authModel.userToken);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return NoteList();
                      },
                    ),
                  );
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
                        "Book Management System",
                        style: GoogleFonts.acme(
                          textStyle: TextStyle(
                              color: Color.fromARGB(255, 101, 101, 101),
                              fontSize: 26),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
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
                        controller: _authorController,
                        decoration: InputDecoration(
                          hintText: "Enter the Author Name",
                          label: Text("Author Name"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Description should not be empty";
                          } else if (value.length < 6) {
                            return "Description must be atleast 6 characters in length";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      TextFormField(
                        controller: _authorAge,
                        decoration: InputDecoration(
                          hintText: "Enter the Author Age",
                          label: Text("Author Age"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Author age should not be empty";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      TextFormField(
                        controller: _authorLastName,
                        decoration: InputDecoration(
                          hintText: "Enter the Author's Last Name",
                          label: Text("Last Name"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Book ID should not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.1,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            padding: EdgeInsets.fromLTRB(25, 15, 25, 15)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authModel.pushBookCon(
                                int.parse(_authorAge.text),
                                _titleController.text,
                                _authorController.text,
                                _authorLastName.text);
                            _authorAge.text = "";
                            _titleController.text = "";
                            _authorController.text = "";
                            _authorLastName.text = "";

                            //authModel.fetchBooksForTheUsers();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Success",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    content: Text("Book added successfully"),
                                  );
                                });
                          }
                        },
                        child: (authModel.isLoading)
                            ? (Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ))
                            : Text(
                                "Submit",
                                style: GoogleFonts.zillaSlab(
                                    textStyle: TextStyle(fontSize: 18),
                                    fontWeight: FontWeight.bold),
                              ),
                      ),

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
