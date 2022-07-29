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
  List<Map<String, dynamic>>? get userNotes;

  static Serializer<AppNotes> get serializer => _$appNotesSerializer;
}
