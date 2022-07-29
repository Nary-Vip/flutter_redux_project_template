import 'package:personal_pjt/actions/actions.dart';
import 'package:personal_pjt/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> authReducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, SaveUser>(setUser),
  TypedReducer<AppState, SetLoader>(setLoader),
  TypedReducer<AppState, SetIsLoginError>(setIsLoginError),
  TypedReducer<AppState, SetInitializer>(setInitializer),
  TypedReducer<AppState, LogOutUser>(logOutUser),
  TypedReducer<AppState, SetErrorMessage>(setErrorMessage),
  TypedReducer<AppState, SetSuccessMessage>(setSuccessMessage),
  TypedReducer<AppState, SaveDataToGlobalData>(fetchUserNotes),
  //TypedReducer<AppState, SetCurrentUser>(setCurrentUser)
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

// AppState setCurrentUser(AppState state, SetCurrentUser action) {
//   final AppStateBuilder b = state.toBuilder();
//   b..currentUser = action.currentUser;
//   return b.build();
// }

AppState setInitializer(AppState state, SetInitializer action) {
  final AppStateBuilder b = state.toBuilder();
  b..isInitializing = action.isInitializing;
  print("=================line 23=========${action.isInitializing}");
  return b.build();
}

AppState logOutUser(AppState state, LogOutUser action) {
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

AppState setUser(AppState state, SaveUser action) {
  final AppStateBuilder b = state.toBuilder();
  b..currentUser = action.userDetails!.toBuilder();
  return b.build();
}

AppState fetchUserNotes(AppState state, SaveDataToGlobalData action) {
  //print(action.email);
  final AppStateBuilder b = state.toBuilder();
  //SetAddNotesAction usrNote = SetAddNotesAction(email: action.email, note: action.note);
  b..userNotesList = action.usrNotes.toBuilder();
  return b.build();
}
