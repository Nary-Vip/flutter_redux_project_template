import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/connector/auth_connector.dart';
import 'package:spotify/i18n/localisation_service.dart';
import 'package:spotify/views/screens/ProfilePage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return AuthConnector(
      builder: (BuildContext c, AuthViewModel model) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: (model.latestAlbumsList == null ||
                    model.saveFetchedPlaylist == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                LocalisationService.of(context)
                                    .translate("Greeting")!,
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.alarm_add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.lock_clock_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) {
                                            return const ProfilePage();
                                          },
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 15, 0),
                          child: Text(
                            LocalisationService.of(context)
                                .translate("Title_Albums")!,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.aBeeZee(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: model.latestAlbumsList!.items!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        model.latestAlbumsList!.items![index]
                                            .images![0].url!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(7),
                                      child: Text(
                                        (model.latestAlbumsList!.items![index]
                                                    .name!.length <=
                                                12)
                                            ? model.latestAlbumsList!
                                                .items![index].name!
                                            : model.latestAlbumsList!
                                                .items![index].name!
                                                .replaceRange(
                                                    11,
                                                    model
                                                        .latestAlbumsList!
                                                        .items![index]
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
                                      model.latestAlbumsList!.items![index]
                                          .artists![0].name!,
                                      style: GoogleFonts.abel(
                                        textStyle: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 15, 0),
                          child: Text(
                            LocalisationService.of(context)
                                .translate("Featured_Playlist")!,
                            style: GoogleFonts.aBeeZee(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: model.saveFetchedPlaylist!.items!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      //borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        model.saveFetchedPlaylist!.items![index]
                                            .images![0].url!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(7),
                                      child: Text(
                                        (model
                                                    .saveFetchedPlaylist!
                                                    .items![index]
                                                    .name!
                                                    .length <=
                                                12)
                                            ? model.saveFetchedPlaylist!
                                                .items![index].name!
                                            : model.saveFetchedPlaylist!
                                                .items![index].name!
                                                .replaceRange(
                                                    11,
                                                    model
                                                        .saveFetchedPlaylist!
                                                        .items![index]
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
                                      "${model.saveFetchedPlaylist!.items![index].tracks!.total} tracks",
                                      style: GoogleFonts.abel(
                                        textStyle: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
