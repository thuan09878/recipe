import 'package:recipes/data/data_source/recipe_remote_data_source.dart';
import 'package:recipes/domain/entities/recipe.dart';

import '../../domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeRemoteDataSource _recipeRemoteDataSource;

  RecipeRepositoryImpl(this._recipeRemoteDataSource);

  @override
  Future<List<Recipe>> getRecipeList() async {
    final response = await _recipeRemoteDataSource.getRecipeList();
    return response.map((e) => e.toDomain()).toList();
  }

}