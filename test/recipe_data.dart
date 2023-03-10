import 'dart:convert';

import 'package:recipes/data/model/recipe_response.dart';

final demoRecipeJson = {
  "calories": "516 kcal",
  "carbos": "47 g",
  "description":
      "There’s nothing like the simple things in life - the smell of freshly cut grass, sitting outside on a nice sunny day, spending time with friends and family. Well here is a recipe that delivers simple culinary pleasures - some nice fresh fish with a crispy crust, crunchy potato wedges and some delightfully sweet sugar snap peas flavoured with cooling mint. Slip into something comfortable and relax into a delicious dinner!",
  "difficulty": 0,
  "fats": "8 g",
  "headline": "with Sweet Potato Wedges and Minted Snap Peas",
  "id": "533143aaff604d567f8b4571",
  "image":
      "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/533143aaff604d567f8b4571.jpg",
  "name": "Crispy Fish Goujons ",
  "proteins": "43 g",
  "thumb":
      "https://img.hellofresh.com/f_auto,q_auto,w_300/hellofresh_s3/image/533143aaff604d567f8b4571.jpg",
  "time": "PT35M"
};

final demoRecipeResponse = RecipeResponse.fromJson(demoRecipeJson);
final List<RecipeResponse> demoRecipeResponseList = [demoRecipeResponse];
final demoRecipeResponseListJson = jsonEncode(demoRecipeResponseList);

final List<RecipeResponse> demoEmptyList = [];
final demoEmptyListJson = jsonEncode(demoEmptyList);