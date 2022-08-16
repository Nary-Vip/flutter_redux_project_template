import 'package:personal_pjt/actions/actions.dart';
import 'package:personal_pjt/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> spotifyReducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, Authentication>(accessToken),
  TypedReducer<AppState, SaveSearchQuery>(saveSearchTracks),
  TypedReducer<AppState, SaveFetchedGenre>(saveFetchedGenre),
  TypedReducer<AppState, SaveFetchedLatestAlbums>(saveLatestAlbum),
  TypedReducer<AppState, SaveFetchedPlaylist>(saveFetchedPlaylist),
  TypedReducer<AppState, SaveFetchedUserProfile>(saveFetchedUserProfile),
]);

AppState accessToken(AppState state, Authentication action) {
  final AppStateBuilder b = state.toBuilder();
  b..accessToken = action.accessToken;
  return b.build();
}

AppState saveFetchedGenre(AppState state, SaveFetchedGenre action) {
  final AppStateBuilder b = state.toBuilder();
  b..genreList = action.genreList!.toBuilder();
  return b.build();
}

AppState saveSearchTracks(AppState state, SaveSearchQuery action) {
  final AppStateBuilder b = state.toBuilder();
  b..searchResults = action.searchResults!.toBuilder();
  return b.build();
}

AppState saveLatestAlbum(AppState state, SaveFetchedLatestAlbums action) {
  final AppStateBuilder b = state.toBuilder();
  b..latestAlbumsList = action.latestAlbumsList!.toBuilder();
  return b.build();
}

AppState saveFetchedPlaylist(AppState state, SaveFetchedPlaylist action) {
  final AppStateBuilder b = state.toBuilder();
  b..saveFetchedPlaylist = action.playlist!.toBuilder();
  return b.build();
}

AppState saveFetchedUserProfile(AppState state, SaveFetchedUserProfile action) {
  final AppStateBuilder b = state.toBuilder();
  b..userProfile = action.userProfile!.toBuilder();
  return b.build();
}
