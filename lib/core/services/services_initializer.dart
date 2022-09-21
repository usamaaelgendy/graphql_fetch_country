import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:graphql_fetch_country/core/services/dependency_injection_services.dart';

/// This class contain all Initializer of our system
/// like (DependencyInjectionInit, LocalizationInit, appThemeInit, APICaller, UserToken, FirebaseInit and userData)
class ServiceInitializer {
  ServiceInitializer._();

  static final ServiceInitializer instance = ServiceInitializer._();

  factory ServiceInitializer() => instance;

  initialize() async {
    await initializeDependencyInjection();
    List futures = [
      initializeScreensOrientation(),
    ];
    await Future.wait<dynamic>([...futures]);
  }

  initializeDependencyInjection() async {
    await DependencyInjectionServices().init();
  }

  initializeScreensOrientation() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }

  initializeFirebase() async {
    await Firebase.initializeApp();
  }
}
