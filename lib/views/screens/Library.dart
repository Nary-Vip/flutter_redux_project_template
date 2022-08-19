import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_pjt/connector/auth_connector.dart';
import 'package:personal_pjt/i18n/localisation_service.dart';
import 'package:personal_pjt/views/screens/PremiumPage.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return AuthConnector(builder: (BuildContext c, AuthViewModel model) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const PremiumPage();
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    LocalisationService.of(context).translate("Nav_Library")!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Favourite Albums",
                    style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              (model.userSavedAlbums == null)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisSpacing: 20),
                          itemCount: model.userSavedAlbums!.items!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onLongPress: () {},
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      model.userSavedAlbums!.items![index]
                                          .album!.images![0].url!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      (model.userSavedAlbums!.items![index]
                                                  .album!.name!.length <=
                                              10)
                                          ? model.userSavedAlbums!.items![index]
                                              .album!.name!
                                          : model.userSavedAlbums!.items![index]
                                              .album!.name!
                                              .replaceRange(
                                                  9,
                                                  model
                                                      .userSavedAlbums!
                                                      .items![index]
                                                      .album!
                                                      .name!
                                                      .length,
                                                  '...'),
                                      style: GoogleFonts.alice(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "${model.userSavedAlbums!.items![index].album!.totalTracks} tracks",
                                    style: GoogleFonts.abel(
                                      textStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
