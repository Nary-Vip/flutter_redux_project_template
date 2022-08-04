import 'package:personal_pjt/actions/actions.dart';
import 'package:personal_pjt/models/api_book.dart';
import 'package:personal_pjt/models/api_bookUser.dart';
import 'package:personal_pjt/models/app_todo.dart';
import 'package:personal_pjt/models/models.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

part 'auth_connector.g.dart';

typedef LogOutConnector = void Function();
typedef BookStoreLoggedInUsrDetails = void Function(
  String username,
  String password,
  ValueChanged<String> onSuccess,
  ValueChanged<String> onError,
);
typedef FetchBookConnector = void Function(String? token);
typedef PushBooksConnector = void Function(
    int? bookId, String? bookTitle, String? authorName, String? authorLastName);
typedef DeleteBookConnector = void Function(int? bookId);

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
        ..userToken = store.state.userToken
        ..deleteBook = (int? id) {
          store.dispatch(DeleteBookAction(id));
        }
        ..getUsrBooks = store.state.getUsrBooks.toBuilder()
        ..pushBookCon = (int? bookId, String? bookTitle, String? authorName,
            String? authorLastName) {
          store.dispatch(
              PushBooks(bookId, bookTitle, authorName, authorLastName));
        }
        ..fetchBooksForTheUsers = (String? token) {
          store.dispatch(FetchBookForTheUser(token));
        }
        ..loginWithPassword = (String username, String password,
            ValueChanged<String> onSuccess, ValueChanged<String> onError) {
          store.dispatch(
              LoginWithPassword(username, password, onError, onSuccess));
        }
        ..bookStoreLoggedInUser = store.state.bookStoreLoggedInUser
        ..currentUser = store.state.currentUser?.toBuilder()
        ..isLoading = store.state.isLoading
        ..logOut = () {
          store.dispatch(LogOutUser());
        };
    });
  }

  BookStoreLoggedInUsrDetails get loginWithPassword;

  DeleteBookConnector get deleteBook;

  PushBooksConnector get pushBookCon;

  String? get userToken;

  String? get bookStoreLoggedInUser;

  FetchBookConnector get fetchBooksForTheUsers;

  BookInfo get getUsrBooks;

  LogOutConnector get logOut;

  AppUser? get currentUser;

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
