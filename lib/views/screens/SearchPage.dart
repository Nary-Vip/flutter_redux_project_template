import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_pjt/connector/auth_connector.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AuthConnector(
      builder: (BuildContext c, AuthViewModel model) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 10, 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Text(
                      "Search",
                      style: GoogleFonts.adventPro(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 20, 10, 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TextField(
                      autofocus: true,
                      controller: _searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIconColor: Colors.white,
                        icon: IconButton(
                          onPressed: () {
                            final text = _searchController.text;
                            model.searchQuery!(text);
                          },
                          icon: Icon(Icons.search),
                          color: Colors.grey,
                        ),
                        hintText: "Artists, songs, or podcasts",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                (model.searchResults != null)
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: model.searchResults!.items!.length,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                subtitle: Text(
                                  "${model.searchResults!.items![index].artists![0].name}",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                leading: Image.network(
                                  "${model.searchResults!.items![index].album!.images![0].url}",
                                ),
                                title: Text(
                                  "${model.searchResults!.items![index].name}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(context).size.height * 0.2, 0, 0),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Play what you love",
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                "Search for artists, songs, podcasts, and more.",
                                maxLines: 2,
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
