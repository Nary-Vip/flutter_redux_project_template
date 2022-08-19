import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:spotify/models/search_track_result.dart';

part 'playlist_model.g.dart';

abstract class PlayListModel
    implements Built<PlayListModel, PlayListModelBuilder> {
  factory PlayListModel(
          [PlayListModelBuilder updates(PlayListModelBuilder builder)]) =
      _$PlayListModel;

  PlayListModel._();

  String? get message;
  SearchTrackResult? get playlists;

  static Serializer<PlayListModel> get serializer => _$playListModelSerializer;
}
