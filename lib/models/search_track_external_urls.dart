import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_track_external_urls.g.dart';

abstract class SearchTrackExternalUrls
    implements Built<SearchTrackExternalUrls, SearchTrackExternalUrlsBuilder> {
  factory SearchTrackExternalUrls(
      [SearchTrackExternalUrlsBuilder updates(
          SearchTrackExternalUrlsBuilder builder)]) = _$SearchTrackExternalUrls;

  SearchTrackExternalUrls._();

  String? get spotify;

  static Serializer<SearchTrackExternalUrls> get serializer =>
      _$searchTrackExternalUrlsSerializer;
}
