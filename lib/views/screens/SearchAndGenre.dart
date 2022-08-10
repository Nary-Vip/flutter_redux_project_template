import 'package:flutter/material.dart';
import 'package:personal_pjt/views/screens/SearchPage.dart';

class SearchAndGenre extends StatefulWidget {
  const SearchAndGenre({Key? key}) : super(key: key);

  @override
  State<SearchAndGenre> createState() => _SearchAndGenreState();
}

class _SearchAndGenreState extends State<SearchAndGenre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 10, 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: TextField(
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
                    hintText: "Artists, songs, or podcasts",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Text(
              "Browse all",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            //ListView.builder(itemBuilder: itemBuilder)
          ],
        ),
      ),
    );
  }
}
