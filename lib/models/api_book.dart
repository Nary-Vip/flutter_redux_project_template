import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'api_book.g.dart';

abstract class BookInfo implements Built<BookInfo, BookInfoBuilder> {
  factory BookInfo([BookInfoBuilder updates(BookInfoBuilder builder)]) =
      _$BookInfo;

  BookInfo._();

  @BuiltValueField(wireName: 'books')
  BuiltList<BookList>? get listOfBooks;

  static Serializer<BookInfo> get serializer => _$bookInfoSerializer;
}

abstract class BookList implements Built<BookList, BookListBuilder> {
  factory BookList([BookListBuilder updates(BookListBuilder builder)]) =
      _$BookList;

  BookList._();

  int? get id;
  String? get title;

  @BuiltValueField(wireName: 'author_name')
  String? get authorName;

  @BuiltValueField(wireName: 'author_age')
  int? get authorAge;

  static Serializer<BookList> get serializer => _$bookListSerializer;
}
