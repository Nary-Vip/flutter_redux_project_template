import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:spotify/models/search_track_result.dart';

part 'search_track.g.dart';

abstract class SearchTrack implements Built<SearchTrack, SearchTrackBuilder> {
  factory SearchTrack(
      [SearchTrackBuilder updates(SearchTrackBuilder builder)]) = _$SearchTrack;

  SearchTrack._();

  SearchTrackResult? get tracks;

  static Serializer<SearchTrack> get serializer => _$searchTrackSerializer;
}
