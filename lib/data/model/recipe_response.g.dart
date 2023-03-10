// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeResponse _$$_RecipeResponseFromJson(Map<String, dynamic> json) =>
    _$_RecipeResponse(
      calories: json['calories'] as String?,
      carbos: json['carbos'] as String?,
      description: json['description'] as String?,
      difficulty: json['difficulty'] as int?,
      fats: json['fats'] as String?,
      headline: json['headline'] as String?,
      id: json['id'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      proteins: json['proteins'] as String?,
      thumb: json['thumb'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$$_RecipeResponseToJson(_$_RecipeResponse instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'carbos': instance.carbos,
      'description': instance.description,
      'difficulty': instance.difficulty,
      'fats': instance.fats,
      'headline': instance.headline,
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'proteins': instance.proteins,
      'thumb': instance.thumb,
      'time': instance.time,
    };
