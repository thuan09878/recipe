import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String calories,
    required String carbos,
    required String description,
    required int difficulty,
    required String fats,
    required String headline,
    required String id,
    required String image,
    required String name,
    required String proteins,
    required String thumb,
    required String time
  }) = _Recipe;

  const Recipe._();
}