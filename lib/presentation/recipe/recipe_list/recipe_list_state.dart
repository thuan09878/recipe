part of 'recipe_list_notifier.dart';

@freezed
class RecipeListState with _$RecipeListState {
  const RecipeListState._();

  const factory RecipeListState.init() = _init;
  const factory RecipeListState.loading() = _loading;
  const factory RecipeListState.success(List<Recipe> recipe) = _success;
  const factory RecipeListState.failed(final Exception exception) = _error;

  bool get isInit => maybeWhen(init: () => true, orElse: () => false);

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);

  bool get isSuccess => maybeMap(success: (_) => true, orElse: () => false);
}