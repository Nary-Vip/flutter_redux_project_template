import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:personal_pjt/models/api_book.dart';
import 'package:personal_pjt/models/api_bookUser.dart';
import 'package:personal_pjt/models/app_todo.dart';
import 'package:personal_pjt/models/models.dart';

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

  String? get bookStoreLoggedInUser;

  //String? get currentUser;

  bool get isInitializing;

  bool get isLoading;

  String? get userToken;

  int get onMessageCount;

  BookInfo get getUsrBooks;

  String? get errorMessage;

  String? get successMessage;

  Pagination? get pagination;

  String? get isLoginError;

  BuiltList<Notifications>? get notificationList;
}
