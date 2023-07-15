import 'package:assignment_pepper/configs/theming.dart';
import 'package:assignment_pepper/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PepperAssignmentApp extends StatelessWidget {
  const PepperAssignmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: Theming.lightTheme,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      builder: (context, child){
        if (child == null) return SizedBox.shrink();
        return child;
      },
    );
  }
}
