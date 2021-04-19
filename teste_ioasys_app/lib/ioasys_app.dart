import 'package:flutter/material.dart';
import 'app/common/coordinator/main_coordinator.dart';
import 'app/common/routes/routes.dart';

class IoasysApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MainCoordinator.navigationKey,
      title: 'IoasysApp',
      initialRoute: Routes.splashScreen,
      onGenerateRoute: Routes.onGenerateRoute,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}