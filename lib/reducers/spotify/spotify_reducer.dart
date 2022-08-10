import 'package:personal_pjt/actions/actions.dart';
import 'package:personal_pjt/models/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> spotifyReducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, Authentication>(accessToken),
  TypedReducer<AppState, SaveSearchQuery>(saveSearchTracks),
]);

AppState accessToken(AppState state, Authentication action) {
  final AppStateBuilder b = state.toBuilder();
  b..accessToken = action.accessToken;
  return b.build();
}

AppState saveSearchTracks(AppState state, SaveSearchQuery action) {
  final AppStateBuilder b = state.toBuilder();
  b..searchResults = action.searchResults!.toBuilder();
  return b.build();
}
