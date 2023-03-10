import 'package:recipes/core/domain/api_error.dart';
import 'package:recipes/data/api/recipe_service.dart';
import 'package:recipes/data/data_source/recipe_remote_data_source.dart';
import 'package:recipes/data/model/recipe_response.dart';

class RecipeRemoteDataSourceImpl extends RecipeRemoteDataSource {
  final RecipeService _appService;

  RecipeRemoteDataSourceImpl(this._appService);

  @override
  Future<List<RecipeResponse>> getRecipeList() {
    return _appService.getRecipeList();
  }

}