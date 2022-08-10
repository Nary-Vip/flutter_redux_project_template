import 'package:personal_pjt/models/search_track.dart';
import 'package:personal_pjt/models/search_track_result.dart';

class UserQueryAction {
  final String? userQuery;

  UserQueryAction({this.userQuery});
}

class SaveSearchQuery {
  final SearchTrackResult? searchResults;

  SaveSearchQuery(this.searchResults);
}

class Authentication {
  final String? accessToken;

  Authentication(this.accessToken);
}

class TriggerAuthentication {}

class FetchAvailableGenre {}
