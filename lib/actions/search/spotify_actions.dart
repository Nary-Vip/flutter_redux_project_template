import 'package:built_collection/built_collection.dart';
import 'package:spotify/models/library_album_result.dart';
import 'package:spotify/models/playlist_model.dart';
import 'package:spotify/models/playlist_track.dart';
import 'package:spotify/models/search_track.dart';
import 'package:spotify/models/search_track_album.dart';
import 'package:spotify/models/search_track_result.dart';
import 'package:spotify/models/user_profile.dart';

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

class FetchUserSavedAlbum {}

class SaveFetchedSavedAlbums {
  final LibraryAlbumResult? userSavedAlbums;

  SaveFetchedSavedAlbums(this.userSavedAlbums);
}

class DeleteSavedAlbum {
  DeleteSavedAlbum({this.id});
  final String? id;
}

class SaveAnUserAlbum {
  final String? id;

  SaveAnUserAlbum({this.id});
}
