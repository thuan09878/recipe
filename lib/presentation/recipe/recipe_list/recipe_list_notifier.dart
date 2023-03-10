import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipes/core/domain/api_error.dart';
import 'package:recipes/core/shared/providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/recipe.dart';
import '../../../domain/repositories/recipe_repository.dart';

part 'recipe_list_state.dart';

part 'recipe_list_notifier.freezed.dart';

final recipeListNotifier =
    StateNotifierProvider.autoDispose<RecipeListNotifier, RecipeListState>(
        (ref) {
  return RecipeListNotifier(ref.watch(recipeRepositoryProvider));
});

class RecipeListNotifier extends StateNotifier<RecipeListState> {
  final RecipeRepository recipeRepository;

  RecipeListNotifier(this.recipeRepository)
      : super(const RecipeListState.init()) {
    getRecipeList();
  }

  void getRecipeList() async {
    state = const RecipeListState.loading();
    try {
      final recipes = await recipeRepository.getRecipeList().safeAsync();
      state = RecipeListState.success(recipes);
    } catch (e) {
      state = RecipeListState.failed(e as Exception);
    }
  }
}
