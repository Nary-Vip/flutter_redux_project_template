import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_todo.g.dart';

abstract class AppNotesJson
    implements Built<AppNotesJson, AppNotesJsonBuilder> {
  factory AppNotesJson(
          [AppNotesJsonBuilder updates(AppNotesJsonBuilder builder)]) =
      _$AppNotesJson;

  AppNotesJson._();

  @BuiltValueField(wireName: 'userId')
  int? get userId;

  @BuiltValueField(wireName: 'id')
  int? get noteId;

  String? get title;

  bool? get completed;
  //List<Map<String, dynamic>>? get userNotes;

  static Serializer<AppNotesJson> get serializer => _$appNotesJsonSerializer;
}
