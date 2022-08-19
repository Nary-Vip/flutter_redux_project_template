import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:spotify/models/search_track_items.dart';

part 'search_track_result.g.dart';

abstract class SearchTrackResult
    implements Built<SearchTrackResult, SearchTrackResultBuilder> {
  factory SearchTrackResult(
      [SearchTrackResultBuilder updates(
          SearchTrackResultBuilder builder)]) = _$SearchTrackResult;

  SearchTrackResult._();

  String? get href;
  BuiltList<SearchTrackItem>? get items;
  int? get limit;
  String? get next;
  int? get offset;
  String? get previous;
  int? get total;

  static Serializer<SearchTrackResult> get serializer =>
      _$searchTrackResultSerializer;
}
