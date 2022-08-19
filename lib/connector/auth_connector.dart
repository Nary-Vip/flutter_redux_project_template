import 'package:built_collection/built_collection.dart';
import 'package:spotify/actions/actions.dart';
import 'package:spotify/models/library_album_result.dart';
import 'package:spotify/models/models.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:spotify/models/search_track_result.dart';
import 'package:spotify/models/user_profile.dart';
import 'package:redux/redux.dart';

part 'auth_connector.g.dart';

typedef LoginWithPasswordAction = void Function(
    String email, String mobile, String password);
typedef SearchPageQueryConnector = void Function(String query);
typedef LogOutAction = void Function();
typedef AuthenticationConnector = void Function();
typedef FetchAvailableGenreConnector = void Function();
typedef FetchLatestAlbumsConnector = void Function();
typedef FetchPlaylist = void Function();
typedef FetchUserProfileConnector = void Function();

abstract class AuthViewModel
    implements Built<AuthViewModel, AuthViewModelBuilder> {
  factory AuthViewModel(
      [AuthViewModelBuilder Function(AuthViewModelBuilder builder)
          updates]) = _$AuthViewModel;

  AuthViewModel._();

  factory AuthViewModel.fromStore(Store<AppState> store) {
    return AuthViewModel((AuthViewModelBuilder b) {
      return b
        ..isInitializing = store.state.isInitializing
        ..currentUser = store.state.currentUser?.toBuilder()
        ..loginWithPassword = (String email, String mobile, String password) {
          store.dispatch(LoginWithPassword(
              email: email, mobile: mobile, password: password));
        }
        ..authentication = () {
          store.dispatch(TriggerAuthentication());
        }
        ..searchQuery = (String query) {
          store.dispatch(UserQueryAction(userQuery: query));
        }
        ..fetchAvailableGenre = () {
          store.dispatch(FetchAvailableGenre());
        }
        ..fetchLatestAlbums = () {
          store.dispatch(FetchLatestAlbums());
        }
        ..latestAlbumsList = store.state.latestAlbumsList?.toBuilder()
        ..fetchPlaylist = () {
          store.dispatch(FetchPlaylistAction());
        }
        ..fetchUserProfile = () {
          store.dispatch(FetchUserProfile());
        }
        ..userProfile = store.state.userProfile?.toBuilder()
        ..userSavedAlbums = store.state.userSavedAlbums?.toBuilder()
        ..saveFetchedPlaylist = store.state.saveFetchedPlaylist?.toBuilder()
        ..genreList = store.state.genreList?.toBuilder()
        ..searchResults = store.state.searchResults?.toBuilder()
        ..accessToken = store.state.accessToken
        ..logOut = () {
          store.dispatch(LogOutUser());
        };
    });
  }

  LoginWithPasswordAction get loginWithPassword;

  FetchPlaylist? get fetchPlaylist;

  SearchTrackResult? get saveFetchedPlaylist;

  LogOutAction get logOut;

  AppUser? get currentUser;

  LibraryAlbumResult? get userSavedAlbums;

  AuthenticationConnector? get authentication;

  SearchPageQueryConnector? get searchQuery;

  bool get isInitializing;

  String? get accessToken;

  SearchTrackResult? get latestAlbumsList;

  SearchTrackResult? get searchResults;

  UserProfile? get userProfile;

  FetchLatestAlbumsConnector? get fetchLatestAlbums;

  FetchAvailableGenreConnector? get fetchAvailableGenre;

  BuiltList<String>? get genreList;

  FetchUserProfileConnector? get fetchUserProfile;
}

class AuthConnector extends StatelessWidget {
  const AuthConnector({required this.builder});

  final ViewModelBuilder<AuthViewModel> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
      builder: builder,
      converter: (Store<AppState> store) => AuthViewModel.fromStore(store),
    );
  }
}
