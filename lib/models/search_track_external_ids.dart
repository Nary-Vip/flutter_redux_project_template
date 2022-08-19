import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_track_external_ids.g.dart';

abstract class SearchTrackExternalIds
    implements Built<SearchTrackExternalIds, SearchTrackExternalIdsBuilder> {
  factory SearchTrackExternalIds(
      [SearchTrackExternalIdsBuilder updates(
          SearchTrackExternalIdsBuilder builder)]) = _$SearchTrackExternalIds;

  SearchTrackExternalIds._();

  String? get isrc;
  String? get upc;

  static Serializer<SearchTrackExternalIds> get serializer =>
      _$searchTrackExternalIdsSerializer;
}
