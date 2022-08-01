import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_notes.g.dart';

abstract class AppNotes implements Built<AppNotes, AppNotesBuilder> {
  factory AppNotes([AppNotesBuilder updates(AppNotesBuilder builder)]) =
      _$AppNotes;

  AppNotes._();

  @BuiltValueField(wireName: 'email')
  String? get userMail;

  @BuiltValueField(wireName: 'noteList')
  BuiltList<AppNotesItem>? get userNotes;
  //List<Map<String, dynamic>>? get userNotes;

  static Serializer<AppNotes> get serializer => _$appNotesSerializer;
}

abstract class AppNotesItem
    implements Built<AppNotesItem, AppNotesItemBuilder> {
  factory AppNotesItem(
          [AppNotesItemBuilder updates(AppNotesItemBuilder builder)]) =
      _$AppNotesItem;

  AppNotesItem._();

  String? get title;
  String? get desc;

  static Serializer<AppNotesItem> get serializer => _$appNotesItemSerializer;
}
