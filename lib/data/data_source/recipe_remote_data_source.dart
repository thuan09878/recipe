import 'package:recipes/data/model/recipe_response.dart';

abstract class RecipeRemoteDataSource {
  Future<List<RecipeResponse>> getRecipeList();
}