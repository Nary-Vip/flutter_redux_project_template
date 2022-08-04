import 'package:personal_pjt/actions/actions.dart';
import 'package:personal_pjt/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> authReducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, SetLoader>(setLoader),
  TypedReducer<AppState, SetIsLoginError>(setIsLoginError),
  TypedReducer<AppState, SetInitializer>(setInitializer),
  TypedReducer<AppState, LogOutUser>(logOutUser),
  TypedReducer<AppState, SetErrorMessage>(setErrorMessage),
  TypedReducer<AppState, SetSuccessMessage>(setSuccessMessage),
  TypedReducer<AppState, GetBookForTheUsers>(getBookForTheUser),
  TypedReducer<AppState, SaveTokenAction>(setUserToken),
  TypedReducer<AppState, SaveUser>(setBookLoggedInUser)
]);

AppState setLoader(AppState state, SetLoader action) {
  final AppStateBuilder b = state.toBuilder();
  b..isLoading = action.isLoading;
  return b.build();
}

AppState setIsLoginError(AppState state, SetIsLoginError action) {
  final AppStateBuilder b = state.toBuilder();
  b..isLoginError = action.isLoginError;
  return b.build();
}

AppState setInitializer(AppState state, SetInitializer action) {
  final AppStateBuilder b = state.toBuilder();
  b..isInitializing = action.isInitializing;
  print("=================line 23=========${action.isInitializing}");
  return b.build();
}

AppState logOutUser(AppState state, LogOutUser action) {
  print("Loggin out");
  final AppStateBuilder b = state.toBuilder();
  b
    ..isInitializing = false
    ..currentUser = null;
  return b.build();
}

AppState setErrorMessage(AppState state, SetErrorMessage action) {
  final AppStateBuilder b = state.toBuilder();
  b
    ..isLoading = false
    ..errorMessage = action.message;
  return b.build();
}

AppState setSuccessMessage(AppState state, SetSuccessMessage action) {
  updateSuccessMessageState(state);
  final AppStateBuilder b = state.toBuilder();
  b
    ..isLoading = false
    ..successMessage = action.message;
  return b.build();
}

void updateSuccessMessageState(AppState state) {
  Future.delayed(Duration(seconds: 1), () {
    final AppStateBuilder b = state.toBuilder();
    b..successMessage = '';
    return b.build();
  });
}

// token dispatch
AppState setBookLoggedInUser(AppState state, SaveUser action) {
  //print(action.email);
  final AppStateBuilder b = state.toBuilder();
  b..currentUser = action.userDetails!.toBuilder();
  print("curr ${b.currentUser.token}");
  return b.build();
}

AppState getBookForTheUser(AppState state, GetBookForTheUsers action) {
  final AppStateBuilder b = state.toBuilder();
  b..getUsrBooks = action.booksOfTheUsers.toBuilder();
  return b.build();
}

AppState setUserToken(AppState state, SaveTokenAction action) {
  final AppStateBuilder b = state.toBuilder();
  b..userToken = action.userToken;
  return b.build();
}
