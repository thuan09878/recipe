import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipes/core/domain/app_exception.dart';
import 'package:recipes/main.dart';
import 'package:recipes/presentation/recipe/recipe_detail/recipe_detail.dart';
import 'package:recipes/presentation/recipe/recipe_list/recipe_list_notifier.dart';
import 'package:recipes/presentation/recipe/widgets/recipe_tile.dart';

import '../../../core/routes/route_names.dart';

class RecipesPage extends ConsumerWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeList = ref.watch(recipeListNotifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: recipeList.maybeWhen(success: (recipes) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return RecipeTile(
              recipe: recipes[index],
              onTap: (recipe) {
                context.goNamed(RouteNames.recipeDetailRoute, extra: recipe);
              },
            );
          },
          itemCount: recipes.length,
        );
      }, failed: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text((error as AppException).message),
              ElevatedButton(onPressed: () {
                ref.read(recipeListNotifier.notifier).getRecipeList();
              }, child: Text('Retry'),),
            ],
          ),
        );
      }, orElse: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
