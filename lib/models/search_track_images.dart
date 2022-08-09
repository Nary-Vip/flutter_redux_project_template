import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_track_images.g.dart';

abstract class SearchTrackImages
    implements Built<SearchTrackImages, SearchTrackImagesBuilder> {
  factory SearchTrackImages(
      [SearchTrackImagesBuilder updates(
          SearchTrackImagesBuilder builder)]) = _$SearchTrackImages;

  SearchTrackImages._();

  int? get height;
  String? get url;
  int? get width;

  static Serializer<SearchTrackImages> get serializer =>
      _$searchTrackImagesSerializer;
}
