import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:personal_pjt/models/library_album_result.dart';
import 'package:personal_pjt/models/models.dart';
import 'package:personal_pjt/models/search_track_result.dart';
import 'package:personal_pjt/models/user_profile.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  factory AppState([AppStateBuilder updates(AppStateBuilder builder)]) =
      _$AppState;

  AppState._();

  static AppState initState() {
    return AppState((AppStateBuilder b) {
      return b
        ..navigator = GlobalKey<NavigatorState>()
        ..isInitializing = true
        ..onMessageCount = 0
        ..isLoading = false;
    });
  }

  GlobalKey<NavigatorState> get navigator;

  AppUser? get currentUser;

  bool get isInitializing;

  bool get isLoading;

  String? get accessToken;

  int get onMessageCount;

  String? get errorMessage;

  String? get successMessage;

  Pagination? get pagination;

  SearchTrackResult? get searchResults;

  BuiltList<String>? get genreList;

  SearchTrackResult? get latestAlbumsList;

  SearchTrackResult? get saveFetchedPlaylist;

  BuiltList<Notifications>? get notificationList;

  UserProfile? get userProfile;

  LibraryAlbumResult? get userSavedAlbums;
}
