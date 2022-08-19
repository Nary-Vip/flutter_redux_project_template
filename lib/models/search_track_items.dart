import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:spotify/models/album_copyright.dart';
import 'package:spotify/models/playlist_owner_model.dart';
import 'package:spotify/models/playlist_track.dart';
import 'package:spotify/models/search_track_album.dart';
import 'package:spotify/models/search_track_artists.dart';
import 'package:spotify/models/search_track_external_ids.dart';
import 'package:spotify/models/search_track_external_urls.dart';
import 'package:spotify/models/search_track_images.dart';

part 'search_track_items.g.dart';

abstract class SearchTrackItem
    implements Built<SearchTrackItem, SearchTrackItemBuilder> {
  factory SearchTrackItem(
          [SearchTrackItemBuilder updates(SearchTrackItemBuilder builder)]) =
      _$SearchTrackItem;

  SearchTrackItem._();

  SearchTrackAlbum? get album;
  BuiltList<SearchTrackArtists>? get artists;

  @BuiltValueField(wireName: 'album_type')
  String? get albumType;

  bool? get collaborative;

  String? get description;

  @BuiltValueField(wireName: 'available_markets')
  BuiltList<String>? get availableMarkets;

  @BuiltValueField(wireName: 'release_date')
  String? get releaseDate;

  @BuiltValueField(wireName: 'total_tracks')
  int? get totalTracks;

  @BuiltValueField(wireName: 'release_date_precision')
  String? get releaseDatePrecision;

  @BuiltValueField(wireName: 'disk_number')
  int? get discNumber;

  @BuiltValueField(wireName: 'duration_ms')
  int? get durationMs;

  bool? get explicit;

  @BuiltValueField(wireName: 'external_ids')
  SearchTrackExternalIds? get externalIds;

  @BuiltValueField(wireName: 'external_urls')
  SearchTrackExternalUrls? get externalUrls;

  String? get href;
  String? get id;

  PlaylistOwner? get owner;

  PlaylistTrack? get tracks;

  @BuiltValueField(wireName: 'snapshot_id')
  String? get snapshotId;

  @BuiltValueField(wireName: 'is_local')
  bool? get isLocal;

  @BuiltValueField(wireName: 'is_playable')
  bool? get isPlayable;

  String? get name;
  int? get popularity;

  @BuiltValueField(wireName: 'preview_url')
  String? get previewUrl;

  @BuiltValueField(wireName: 'track_number')
  int? get trackNumber;

  BuiltList<SearchTrackImages>? get images;

  String? get type;
  String? get uri;

  static Serializer<SearchTrackItem> get serializer =>
      _$searchTrackItemSerializer;
}
