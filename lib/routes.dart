import 'package:assignment_pepper/core/slide_page_route.dart';
import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';
import 'package:assignment_pepper/ui/screens/home/operations_detail_screen.dart';
import 'package:assignment_pepper/ui/screens/home/operations_home_screen.dart';
import 'package:flutter/material.dart';

enum Routes { home, operationDetails }

class _Paths {
  static const String home = '/';
  static const String operationDetails = '/operationDetails';

  static const Map<Routes, String> _pathMap = {
    Routes.home: _Paths.home,
    Routes.operationDetails: _Paths.operationDetails,
  };

  static String of(Routes route) => _pathMap[route] ?? home;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case _Paths.operationDetails:
        return SlideRoute(page: OperationsDetailScreen(operation: args?["operation"] as BasicOperationModel,), settings: settings);
      case _Paths.home:
      default:
        return SlideRoute(page: OperationsHomeScreen(), settings: settings);
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
