import 'package:flutter/material.dart';
import 'package:personal_pjt/models/api_book.dart';
import 'package:personal_pjt/models/api_success.dart';
import 'package:personal_pjt/models/app_todo.dart';

class CheckForUserInPrefs {}

//********************************* login-in ***********************************//
class LoginWithPassword {
  LoginWithPassword(this.username, this.password, this.onError, this.onSuccess);

  //final User loggedInBookStoreUser;
  final String username;
  final String password;
  final ValueChanged<String> onSuccess;
  final ValueChanged<String> onError;
}

class SaveUser {
  final ApiSuccess? userDetails;

  SaveUser(this.userDetails);
}

//***************************** log-out ***************************************//
class LogOutUser {}

//*********************** force-log-out ***************************************//
class ForceLogOutUser {
  ForceLogOutUser({required this.error});

  final dynamic error;
}

//**************************** manage loading status *************************//
class SetLoader {
  SetLoader(this.isLoading);

  final bool isLoading;
}

//**************************** manage login state *************************//
class SetIsLoginError {
  SetIsLoginError({required this.isLoginError});

  final String? isLoginError;
}

//**************************** manage initializer status *************************//
class SetInitializer {
  SetInitializer(this.isInitializing);

  final bool isInitializing;
}

//**************************** manage error message ***************************//
class SetErrorMessage {
  SetErrorMessage({required this.message});

  final String message;
}

//**************************** manage success message *************************//
class SetSuccessMessage {
  SetSuccessMessage({required this.message});

  final String message;
}

//**************************** manage adding notes *************************//

class SetAddNotesAction {
  SetAddNotesAction({required this.email, required this.note});

  final String email;
  final Map<String, dynamic> note;
}

//**************************** manage fetching notes *************************//

class GetFetchingNotes {}

class SaveDataToGlobalData {
  final AppNotesJson usrNotes;

  SaveDataToGlobalData(this.usrNotes);
}

//**************************** trigger the fetch Function *************************//
class LoggedInMail {
  final String email;

  LoggedInMail(this.email);
}

//**************************** save the user logged *************************//
class LoggedInUser {
  final String email;

  LoggedInUser(this.email);
}

//Doubt Use same action for req books with token and save them.

class SaveTokenAction {
  final String? userToken;

  SaveTokenAction(this.userToken);
}
