import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_pjt/connector/auth_connector.dart';
import 'dart:math';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  Random random = new Random();
  List<MaterialAccentColor> colors = [
    Colors.blueAccent,
    Colors.redAccent,
    Colors.deepPurpleAccent,
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
        builder: (BuildContext authContext, AuthViewModel authModel) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Your Books",
            style: GoogleFonts.actor(
              textStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: (authModel.isLoading == true)
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.blueAccent,
                  ),
                )
              : (authModel.getUsrBooks.listOfBooks!.length == 0)
                  ? Text("No Book Available")
                  : Center(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: ListView.builder(
                                itemCount:
                                    authModel.getUsrBooks.listOfBooks!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: (index < 4)
                                          ? colors[index]
                                          : colors[random.nextInt(3)],
                                      borderRadius: BorderRadius.circular(15),
                                      border:
                                          Border.all(color: Colors.transparent),
                                    ),
                                    margin: EdgeInsets.all(10),
                                    padding:
                                        EdgeInsets.fromLTRB(13, 15, 13, 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              (authModel
                                                          .getUsrBooks
                                                          .listOfBooks![index]
                                                          .title!
                                                          .length >
                                                      17)
                                                  ? "${authModel.getUsrBooks.listOfBooks![index].title!.replaceRange(17, authModel.getUsrBooks.listOfBooks![index].title!.length, "...")}"
                                                  : "${authModel.getUsrBooks.listOfBooks![index].title}",
                                              maxLines: 2,
                                              style: GoogleFonts.aBeeZee(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22),
                                              ),
                                            ),
                                            PopupMenuButton<String>(
                                              color: Colors.white,
                                              icon: Icon(
                                                Icons.more_horiz,
                                                color: Colors.white,
                                              ),
                                              onSelected: (String value) {
                                                switch (value) {
                                                  case 'Edit':
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          title: Text("Oops !"),
                                                          content: Text(
                                                              "Edit option is in WIP"),
                                                        );
                                                      },
                                                    );
                                                    break;
                                                  case 'Delete':
                                                    authModel.deleteBook(
                                                        authModel
                                                            .getUsrBooks
                                                            .listOfBooks![index]
                                                            .id);
                                                    authModel
                                                        .fetchBooksForTheUsers(
                                                            authModel
                                                                .userToken);
                                                    break;
                                                }
                                              },
                                              itemBuilder:
                                                  (BuildContext context) {
                                                return {'Edit', 'Delete'}
                                                    .map((String choice) {
                                                  return PopupMenuItem<String>(
                                                    value: choice,
                                                    child: Text(
                                                      choice,
                                                      style: GoogleFonts.inder(
                                                        textStyle: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  );
                                                }).toList();
                                              },
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Book ID : ${authModel.getUsrBooks.listOfBooks![index].id}",
                                          style: GoogleFonts.aBeeZee(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 28,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              "${authModel.getUsrBooks.listOfBooks![index].authorAge} Years",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.book,
                                              color: Colors.white,
                                              size: 28,
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              "${authModel.getUsrBooks.listOfBooks![index].authorName}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ],
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
      );
    });
  }
}
