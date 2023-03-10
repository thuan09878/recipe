import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipes/data/api/recipe_service.dart';
import 'package:recipes/data/data_source/recipe_remote_data_source_impl.dart';
import 'package:recipes/data/repositories/recipe_repository_impl.dart';

import '../routes/route_notifier.dart';

final dioProvider = Provider((ref) => Dio());

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);
  return GoRouter(
    refreshListenable: router,
    redirect: router.redirectLogic,
    routes: router.routes,
  );
});

final recipeProvider = Provider(
      (ref) => RecipeService(ref.watch(dioProvider)),
);

final recipeRemoteDataSourceProvider = Provider((ref) {
  return RecipeRemoteDataSourceImpl(ref.watch(recipeProvider));
});

final recipeRepositoryProvider = Provider((ref) {
  return RecipeRepositoryImpl(ref.watch(recipeRemoteDataSourceProvider));
});