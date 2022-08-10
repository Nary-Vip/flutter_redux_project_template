import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:personal_pjt/models/search_track_artists.dart';
import 'package:personal_pjt/models/search_track_external_urls.dart';
import 'package:personal_pjt/models/search_track_images.dart';

part 'search_track_album.g.dart';

abstract class SearchTrackAlbum
    implements Built<SearchTrackAlbum, SearchTrackAlbumBuilder> {
  factory SearchTrackAlbum(
          [SearchTrackAlbumBuilder updates(SearchTrackAlbumBuilder builder)]) =
      _$SearchTrackAlbum;

  SearchTrackAlbum._();

  String? get albumType;
  BuiltList<SearchTrackArtists>? get artists;
  SearchTrackExternalUrls? get externalUrls;
  String? get href;
  String? get id;
  BuiltList<SearchTrackImages>? get images;
  String? get name;
  String? get releaseDate;
  String? get releaseDatePrecision;
  int? get totalTracks;
  String? get type;
  String? get uri;

  static Serializer<SearchTrackAlbum> get serializer =>
      _$searchTrackAlbumSerializer;
}
