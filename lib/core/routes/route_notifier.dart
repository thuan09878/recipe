import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipes/domain/entities/recipe.dart';
import 'package:recipes/presentation/recipe/recipe_detail/recipe_detail.dart';

import '../../presentation/recipe/recipe_list/recipes_page.dart';
import 'route_names.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref);

  final Ref _ref;

  String? redirectLogic(BuildContext context, GoRouterState state) {
    return null;
  }

  List<GoRoute> get routes {
    return [
      GoRoute(
        name: "/",
        path: "/",
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const RecipesPage(),
        ),
        routes: [
          GoRoute(
            name: RouteNames.recipeDetailRoute,
            path: RouteNames.recipeDetailRoute,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: RecipeDetailPage(
                recipe: state.extra as Recipe,
              ),
            ),
          ),
        ],
      ),
    ];
  }
}
