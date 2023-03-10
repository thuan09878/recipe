import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:recipes/data/model/recipe_response.dart';
import 'package:injectable/injectable.dart';

part 'recipe_service.g.dart';

@RestApi()
abstract class RecipeService {
  @factoryMethod
  factory RecipeService(Dio dio, {String baseUrl}) = _RecipeService;

  @GET("android-test/recipes.json")
  Future<List<RecipeResponse>> getRecipeList();
}