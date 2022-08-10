import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:personal_pjt/models/search_track_album.dart';
import 'package:personal_pjt/models/search_track_artists.dart';
import 'package:personal_pjt/models/search_track_external_ids.dart';
import 'package:personal_pjt/models/search_track_external_urls.dart';

part 'search_track_items.g.dart';

abstract class SearchTrackItem
    implements Built<SearchTrackItem, SearchTrackItemBuilder> {
  factory SearchTrackItem(
          [SearchTrackItemBuilder updates(SearchTrackItemBuilder builder)]) =
      _$SearchTrackItem;

  SearchTrackItem._();

  SearchTrackAlbum? get album;
  BuiltList<SearchTrackArtists>? get artists;
  int? get discNumber;
  int? get durationMs;
  bool? get explicit;
  SearchTrackExternalIds? get externalIds;
  SearchTrackExternalUrls? get externalUrls;
  String? get href;
  String? get id;
  bool? get isLocal;
  bool? get isPlayable;
  String? get name;
  int? get popularity;
  String? get previewUrl;
  int? get trackNumber;
  String? get type;
  String? get uri;

  static Serializer<SearchTrackItem> get serializer =>
      _$searchTrackItemSerializer;
}
