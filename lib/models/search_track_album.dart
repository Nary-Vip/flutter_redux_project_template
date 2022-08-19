import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:personal_pjt/models/album_copyright.dart';
import 'package:personal_pjt/models/search_track.dart';
import 'package:personal_pjt/models/search_track_artists.dart';
import 'package:personal_pjt/models/search_track_external_urls.dart';
import 'package:personal_pjt/models/search_track_images.dart';
import 'package:personal_pjt/models/search_track_result.dart';

part 'search_track_album.g.dart';

abstract class SearchTrackAlbum
    implements Built<SearchTrackAlbum, SearchTrackAlbumBuilder> {
  factory SearchTrackAlbum(
          [SearchTrackAlbumBuilder updates(SearchTrackAlbumBuilder builder)]) =
      _$SearchTrackAlbum;

  SearchTrackAlbum._();

  BuiltList<AlbumCopyright>? get copyrights;

  String? get label;

  @BuiltValueField(wireName: 'album_type')
  String? get albumType;

  @BuiltValueField(wireName: 'available_markets')
  BuiltList<String>? get availableMarkets;

  BuiltList<SearchTrackArtists>? get artists;

  @BuiltValueField(wireName: 'external_urls')
  SearchTrackExternalUrls? get externalUrls;

  String? get href;
  String? get id;

  int? get popularity;

  BuiltList<SearchTrackImages>? get images;
  String? get name;

  @BuiltValueField(wireName: 'release_date')
  String? get releaseDate;

  @BuiltValueField(wireName: 'release_date_precision')
  String? get releaseDatePrecision;

  @BuiltValueField(wireName: 'total_tracks')
  int? get totalTracks;

  SearchTrackResult? get tracks;

  String? get type;
  String? get uri;

  static Serializer<SearchTrackAlbum> get serializer =>
      _$searchTrackAlbumSerializer;
}
