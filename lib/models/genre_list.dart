import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'genre_list.g.dart';

abstract class GenreList implements Built<GenreList, GenreListBuilder> {
  factory GenreList([GenreListBuilder updates(GenreListBuilder builder)]) =
      _$GenreList;

  GenreList._();

  BuiltList<String> get genres;

  static Serializer<GenreList> get serializer => _$genreListSerializer;
}
