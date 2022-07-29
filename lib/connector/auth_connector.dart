import 'package:personal_pjt/actions/actions.dart';
import 'package:personal_pjt/models/app_notes.dart';
import 'package:personal_pjt/models/models.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

part 'auth_connector.g.dart';

typedef LoginWithPasswordAction = void Function(String email, String password,
    ValueChanged<String> onSuccess, ValueChanged<String> onError);
typedef AppNotesAction = void Function(String email, Map<String, dynamic> note);
typedef LoggedInMailConnector = void Function(String email);
typedef LogOutAction = void Function();

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
        ..isLoading = store.state.isLoading
        ..loggedInmail = (String email) {
          store.dispatch(loggedInMail(email));
        }
        ..getUserNotes = store.state.userNotesList?.toBuilder()
        ..isLoginError = store.state.isLoginError
        ..loginWithPassword = (String email, String password,
            ValueChanged<String> onSuccess, ValueChanged<String> onError) {
          store.dispatch(LoginWithPassword(
              email: email,
              password: password,
              onSuccess: onSuccess,
              onError: onError));
        }
        ..mailAndNotes = (String email, Map<String, dynamic> note) {
          store.dispatch(SetAddNotesAction(email: email, note: note));
        }
        ..logOut = () {
          store.dispatch(LogOutUser());
        };
    });
  }

  LoginWithPasswordAction get loginWithPassword;

  AppNotes get getUserNotes;

  LoggedInMailConnector get loggedInmail;

  LogOutAction get logOut;

  AppUser? get currentUser;

  AppNotesAction get mailAndNotes;

  bool get isInitializing;

  bool get isLoading;

  String? get isLoginError;
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
