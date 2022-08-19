import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:personal_pjt/models/album_copyright.dart';
import 'package:personal_pjt/models/library_album_result.dart';
import 'package:personal_pjt/models/library_item.dart';
import 'package:personal_pjt/models/models.dart';
import 'package:personal_pjt/models/playlist_model.dart';
import 'package:personal_pjt/models/playlist_owner_model.dart';
import 'package:personal_pjt/models/playlist_track.dart';
import 'package:personal_pjt/models/search_track.dart';
import 'package:personal_pjt/models/search_track_album.dart';
import 'package:personal_pjt/models/search_track_artists.dart';
import 'package:personal_pjt/models/search_track_external_ids.dart';
import 'package:personal_pjt/models/search_track_external_urls.dart';
import 'package:personal_pjt/models/search_track_images.dart';
import 'package:personal_pjt/models/search_track_items.dart';
import 'package:personal_pjt/models/search_track_result.dart';
import 'package:personal_pjt/models/user_follower.dart';
import 'package:personal_pjt/models/user_profile.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  Pagination,
  ApiError,
  ApiSuccess,
  AppUser,
  Notifications,
  FileAttachment,
  AccessToken,
  SearchTrack,
  SearchTrackAlbum,
  SearchTrackArtists,
  SearchTrackExternalIds,
  SearchTrackExternalUrls,
  SearchTrackImages,
  SearchTrackItem,
  SearchTrackResult,
  SearchModel,
  PlayListModel,
  PlaylistTrack,
  PlaylistOwner,
  UserProfile,
  UserFollowers,
  AlbumCopyright,
  LibraryAlbumResult,
  LibraryItem,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
