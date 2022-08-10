import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:personal_pjt/data/app_repository.dart';
import 'package:personal_pjt/models/models.dart';
import 'package:personal_pjt/models/search_track_result.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
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
      TypedMiddleware<AppState, TriggerAuthentication>(triggerAuthentication)
    ];
  }

  void userQueryAction(Store<AppState> store, UserQueryAction action,
      NextDispatcher next) async {
    try {
      print("Action nnnnnn ${action.userQuery}");
      final SearchModelBuilder obj = SearchModel().toBuilder();
      obj
        ..limit = 10
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
    print("TOken comming");
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
      print(parsedJson);
      store.dispatch(Authentication(parsedJson['access_token']));
    } catch (e) {
      print(e);
    }
  }
}
