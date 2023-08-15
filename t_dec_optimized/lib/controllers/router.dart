
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/home_page.dart';

part 'router.g.dart';

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
      ],
    );
  }
}
