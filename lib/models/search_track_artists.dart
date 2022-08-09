import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:personal_pjt/models/search_track_external_urls.dart';

part 'search_track_artists.g.dart';

abstract class SearchTrackArtists
    implements Built<SearchTrackArtists, SearchTrackArtistsBuilder> {
  factory SearchTrackArtists(
      [SearchTrackArtistsBuilder updates(
          SearchTrackArtistsBuilder builder)]) = _$SearchTrackArtists;

  SearchTrackArtists._();

  SearchTrackExternalUrls? get externalUrls;
  String? get href;
  String? get id;
  String? get name;
  String? get type;
  String? get uri;

  static Serializer<SearchTrackArtists> get serializer =>
      _$searchTrackArtistsSerializer;
}
