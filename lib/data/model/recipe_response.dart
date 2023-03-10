import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipes/domain/entities/recipe.dart';

part 'recipe_response.g.dart';

part 'recipe_response.freezed.dart';

@freezed
class RecipeResponse with _$RecipeResponse {
  const factory RecipeResponse(
      {@JsonKey(name: "calories") final String? calories,
      @JsonKey(name: "carbos") final String? carbos,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "difficulty") final int? difficulty,
      @JsonKey(name: "fats") final String? fats,
      @JsonKey(name: "headline") final String? headline,
      @JsonKey(name: "id") final String? id,
      @JsonKey(name: "image") final String? image,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "proteins") final String? proteins,
      @JsonKey(name: "thumb") final String? thumb,
      @JsonKey(name: "time") final String? time}) = _RecipeResponse;

  const RecipeResponse._();

  factory RecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseFromJson(json);

  Recipe toDomain() => Recipe(
        calories: calories ?? '',
        carbos: carbos ?? '',
        description: description ?? '',
        difficulty: difficulty ?? 0,
        fats: fats ?? '',
        headline: headline ?? '',
        id: id ?? '',
        image: image ?? '',
        name: name ?? '',
        proteins: proteins ?? '',
        thumb: thumb ?? '',
        time: time ?? '',
      );
}
