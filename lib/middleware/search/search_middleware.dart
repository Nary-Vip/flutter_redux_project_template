import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify/data/app_repository.dart';
import 'package:spotify/models/library_album_result.dart';
import 'package:spotify/models/models.dart';
import 'package:spotify/models/search_track_result.dart';
import 'package:spotify/models/user_profile.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../actions/search/spotify_actions.dart';
import '../../data/services/search/search_service.dart';

class SearchMiddleware {
  SearchMiddleware({required this.repository})
      : searchService = repository.getService<SearchService>() as SearchService;

  final AppRepository repository;
  final SearchService searchService;

  List<Middleware<AppState>> createAuthMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, UserQueryAction>(userQueryAction),
      TypedMiddleware<AppState, TriggerAuthentication>(triggerAuthentication),
      TypedMiddleware<AppState, FetchAvailableGenre>(fetchAvailableGenre),
      TypedMiddleware<AppState, FetchLatestAlbums>(fetchLatestAlbums),
      TypedMiddleware<AppState, FetchPlaylistAction>(fetchPlaylists),
      TypedMiddleware<AppState, FetchUserProfile>(fetchUserProfile),
      TypedMiddleware<AppState, FetchUserSavedAlbum>(fetchUserSavedAlbum)
    ];
  }

  void fetchLatestAlbums(Store<AppState> store, FetchLatestAlbums action,
      NextDispatcher next) async {
    print("Fetching Albums");
    try {
      final ApiSuccess? response =
          await searchService.fetchLatestAlbums(store.state.accessToken!);

      store.dispatch(SaveFetchedLatestAlbums(response!.albumList));
    } catch (e) {
      print(e);
    }
  }

  void fetchPlaylists(Store<AppState> store, FetchPlaylistAction action,
      NextDispatcher next) async {
    print("Fetching playlist");
    try {
      final ApiSuccess? response =
          await searchService.fetchPlaylist(store.state.accessToken!);

      store.dispatch(SaveFetchedPlaylist(response!.playlists!));
    } catch (e) {
      print(e);
    }
  }

  void fetchUserSavedAlbum(Store<AppState> store, FetchUserSavedAlbum action,
      NextDispatcher next) async {
    print("Fetching User albums");
    try {
      String? token = dotenv.env['TEMP_LIB_TOKEN'];
      final LibraryAlbumResult? response =
          await searchService.fetchUserSavedAlbum(token!);
      store.dispatch(SaveFetchedSavedAlbums(response!));
      print("Userrrrr album ${store.state.userSavedAlbums}");
    } catch (e) {
      print("Errorr $e");
    }
  }

  void deleteSavedAlbum(Store<AppState> store, DeleteSavedAlbum action,
      NextDispatcher next) async {
    print("Fetching User albums");
    try {
      String? token = dotenv.env['TEMP_LIB_TOKEN'];
      final LibraryAlbumResult? response =
          await searchService.fetchUserSavedAlbum(token!);
      store.dispatch(SaveFetchedSavedAlbums(response!));
      print("Userrrrr album ${store.state.userSavedAlbums}");
    } catch (e) {
      print("Errorr $e");
    }
  }

  void fetchUserProfile(Store<AppState> store, FetchUserProfile action,
      NextDispatcher next) async {
    print("Fetching User Profile");
    try {
      final UserProfile? response =
          await searchService.fetchUserProfile(store.state.accessToken!);

      store.dispatch(SaveFetchedUserProfile(response!));
    } catch (e) {
      print("errorrr $e");
    }
  }

  void fetchAvailableGenre(Store<AppState> store, FetchAvailableGenre action,
      NextDispatcher next) async {
    print("Fetching Albums");
    try {
      final ApiSuccess? response =
          await searchService.fetchGenre(store.state.accessToken!);

      store.dispatch(SaveFetchedGenre(response!.genreList!));
    } catch (e) {
      print(e);
    }
  }

  void userQueryAction(Store<AppState> store, UserQueryAction action,
      NextDispatcher next) async {
    try {
      final SearchModelBuilder obj = SearchModel().toBuilder();
      obj
        ..limit = 20
        ..market = "IN"
        ..offset = 0
        ..q = action.userQuery
        ..token = store.state.accessToken
        ..type = "track";

      final SearchTrackResult? response =
          await searchService.spotifySearch(objToApi: obj.build());
      store.dispatch(SaveSearchQuery(response!));
    } catch (e) {
      print(e);
    }
  }

  //Authentication
  void triggerAuthentication(Store<AppState> store,
      TriggerAuthentication action, NextDispatcher next) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      String? id = dotenv.env['CLIENT_ID'];
      String? secret = dotenv.env['CLIENT_SECRET'];

      final Map<String, String> body = {"grant_type": "client_credentials"};
      const String url = "https://accounts.spotify.com/api/token";
      Codec<String, String> stringToBase64 = utf8.fuse(base64);

      String encoded = stringToBase64.encode(id! + ':' + secret!);
      Map<String, String> headers = {
        "Authorization": "Basic " + encoded,
        "Content-Type": "application/x-www-form-urlencoded",
      };
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
        encoding: Encoding.getByName("utf-8"),
      );

      var parsedJson = json.decode(response.body);
      store.dispatch(Authentication(parsedJson['access_token']));
      print(parsedJson["access_token"]);
      await prefs.setString('SpotifyToken', parsedJson['access_token']);
    } catch (e) {
      print(e);
    }
  }
}
