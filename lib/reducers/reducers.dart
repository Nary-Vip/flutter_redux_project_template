import 'package:spotify/models/models.dart';
import 'package:spotify/reducers/auth/auth_reducer.dart';
import 'package:spotify/reducers/notification/notification_reducer.dart';
import 'package:spotify/reducers/spotify/spotify_reducer.dart';
import 'package:redux/redux.dart';

Reducer<AppState> reducer = combineReducers(
    <Reducer<AppState>>[authReducer, notificationReducer, spotifyReducer]);
