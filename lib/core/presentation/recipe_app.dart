import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../config/configuration.dart';
import '../../../style/style.dart';
import '../shared/providers.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  ref.read(dioProvider).options = BaseOptions(
    connectTimeout: BuildConfig.get().connectTimeout,
    receiveTimeout: BuildConfig.get().receiveTimeout,
    validateStatus: (status) {
      return true;
    },
    baseUrl: BuildConfig.get().baseUrl,
  );

  if (!BuildConfig.isProduction) {
    ref.read(dioProvider).interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ));
  }

  return unit;
});

class RecipeApp extends HookConsumerWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, __) {});

    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: "Recipes",
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme(context),
      darkTheme: Themes.darkTheme(context),
      themeMode: ThemeMode.light,
    );
  }
}
