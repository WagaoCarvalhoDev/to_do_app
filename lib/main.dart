import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/src/app_widget.dart';

import 'src/data/repositories/configs/analytics.dart';
import 'src/data/repositories/configs/database.dart';
import 'src/data/repositories/configs/performance_monitoring.dart';
import 'src/data/repositories/configs/remote_config.dart';
import 'src/data/repositories/configs/settings.dart';
import 'src/presentation/pages/splash_screen.dart';

void main() async {
  debugPrint('App Starting: ${DateTime.now()}');
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashScreen());

  await Future.wait([
    Settings.instance.initialize(),
    Database.open(table: 'notes'),

    //Setup Remote Config & AB Tests
    RemoteConfig.instance.getConfigs(),
    RemoteConfig.instance.loadExperiments(),

    //Setup Crash & Performance Monitoring
    PerformanceMonitoring.instance.start(env: Environment.production),
    //Setup App Analytics
    Analytics.instance.initialize(),
  ]);

  runApp(const ProviderScope(
    child: AppWidget(),
  ));

  debugPrint('App Loaded: ${DateTime.now()}');
}
