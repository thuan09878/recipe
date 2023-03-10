import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../domain/entities/recipe.dart';

class RecipeTile extends StatelessWidget {
  final Function(Recipe) onTap;
  final Recipe recipe;

  const RecipeTile({Key? key, required this.recipe, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap.call(recipe);
      },
      leading: CachedNetworkImage(
        imageUrl: recipe.thumb,
        width: 80,
        height: 80,
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(recipe.name),
            const SizedBox(
              height: 8,
            ),
            Text(recipe.headline, style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
      ),
    );
  }
}
