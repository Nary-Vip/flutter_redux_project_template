import 'package:built_collection/built_collection.dart';
import 'package:personal_pjt/models/playlist_model.dart';
import 'package:personal_pjt/models/playlist_track.dart';
import 'package:personal_pjt/models/search_track.dart';
import 'package:personal_pjt/models/search_track_album.dart';
import 'package:personal_pjt/models/search_track_result.dart';
import 'package:personal_pjt/models/user_profile.dart';

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

class SaveFetchedGenre {
  final BuiltList<String>? genreList;

  SaveFetchedGenre(this.genreList);
}

class FetchLatestAlbums {}

class SaveFetchedLatestAlbums {
  final SearchTrackResult? latestAlbumsList;

  SaveFetchedLatestAlbums(this.latestAlbumsList);
}

class FetchPlaylistAction {}

class SaveFetchedPlaylist {
  final SearchTrackResult? playlist;

  SaveFetchedPlaylist(this.playlist);
}

class FetchUserProfile {}

class SaveFetchedUserProfile {
  final UserProfile? userProfile;

  SaveFetchedUserProfile(this.userProfile);
}
