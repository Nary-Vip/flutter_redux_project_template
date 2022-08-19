import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/connector/auth_connector.dart';
import 'package:spotify/views/screens/SearchPage.dart';

import '../../i18n/localisation_service.dart';

class SearchAndGenre extends StatefulWidget {
  const SearchAndGenre({Key? key}) : super(key: key);

  @override
  State<SearchAndGenre> createState() => _SearchAndGenreState();
}

class _SearchAndGenreState extends State<SearchAndGenre> {
  Random random = new Random();
  List<MaterialAccentColor> colors = [
    Colors.blueAccent,
    Colors.redAccent,
    Colors.deepPurpleAccent,
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.limeAccent,
    Colors.tealAccent,
    Colors.indigoAccent
  ];

  @override
  Widget build(BuildContext context) {
    return AuthConnector(
      builder: (BuildContext c, AuthViewModel model) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 10, 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextField(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const SearchPage();
                            },
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIconColor: Colors.white,
                        icon: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const SearchPage();
                                },
                              ),
                            );
                          },
                          icon: Icon(Icons.search),
                          color: Colors.grey,
                        ),
                        hintText: LocalisationService.of(context)
                            .translate("SearchHint")!,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 30),
                    child: Text(
                      LocalisationService.of(context).translate("Browse_All")!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                (model.genreList == null)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: model.genreList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: (index < 7)
                                  ? colors[index]
                                  : colors[random.nextInt(8)],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.transparent),
                            ),
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.fromLTRB(13, 15, 13, 20),
                            child: Center(
                              child: Text(
                                "${model.genreList![index]}",
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
