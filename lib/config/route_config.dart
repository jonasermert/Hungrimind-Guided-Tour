import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guidedtour/home/home_view.dart';
import 'package:guidedtour/not_found/not_found_view.dart';
import 'package:go_router/go_router.dart';

abstract final class RoutePaths {
  static const home = '/';
  static const notFound = '/404';
}

final routes = [
  GoRoute(
    path: RoutePaths.home,
    pageBuilder: (context, state) => _buildPage(const HomeView(), state),
  ),
  GoRoute(
    path: RoutePaths.notFound,
    pageBuilder: (context, state) => _buildPage(const NotFoundView(), state),
  ),
];

Page<void> _buildPage(Widget child, GoRouterState state) {
  if (kIsWeb) {
    return NoTransitionPage(key: state.pageKey, child: child);
  }
  return MaterialPage(key: state.pageKey, child: child);
}
