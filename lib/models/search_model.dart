import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_model.g.dart';

abstract class SearchModel implements Built<SearchModel, SearchModelBuilder> {
  factory SearchModel(
      [SearchModelBuilder updates(SearchModelBuilder builder)]) = _$SearchModel;

  SearchModel._();

  String? get q;

  String? get type;

  String? get market;

  int? get limit;

  int? get offset;

  static Serializer<SearchModel> get serializer => _$searchModelSerializer;
}
