import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:personal_pjt/models/app_notes.dart';

import 'package:personal_pjt/models/models.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  Pagination,
  ApiError,
  ApiSuccess,
  AppUser,
  Notifications,
  FileAttachment,
  AccessToken,
  AppNotes,
  AppNotesItem
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(new StandardJsonPlugin())).build();
