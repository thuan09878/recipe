import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:recipes/data/api/recipe_service.dart';
import 'package:recipes/data/data_source/recipe_remote_data_source.dart';
import 'package:recipes/data/data_source/recipe_remote_data_source_impl.dart';
import 'package:recipes/data/repositories/recipe_repository_impl.dart';
import 'package:recipes/domain/repositories/recipe_repository.dart';

import 'recipe_data.dart';

late MockWebServer _server;
late RecipeService _recipeService;
late RecipeRepository _repository;
late RecipeRemoteDataSource _recipeRemoteDataSource;
final _headers = {"Content-Type": "application/json; charset=utf-8"};

void main() {
  setUp(() async {
    _server = MockWebServer();
    await _server.start();
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));
    _recipeService = RecipeService(dio, baseUrl: _server.url);
    _recipeRemoteDataSource = RecipeRemoteDataSourceImpl(_recipeService);
    _repository = RecipeRepositoryImpl(_recipeRemoteDataSource);
  });

  tearDown(() {
    _server.shutdown();
  });

  test("test empty recipe list", () async {
    _server.enqueue(body: demoEmptyListJson, headers: _headers);
    final tasks = await _repository.getRecipeList();
    expect(tasks, isNotNull);
    expect(tasks.length, 0);
  });

  test("test recipe list", () async {
    _server.enqueue(body: demoRecipeResponseListJson, headers: _headers);
    final tasks = await _repository.getRecipeList();
    expect(tasks, isNotNull);
    expect(tasks.length, 1);
  });
}
