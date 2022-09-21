import 'package:flutter/material.dart';
import 'package:graphql_fetch_country/core/services/services_initializer.dart';
import 'package:graphql_fetch_country/countries/presentation/screens/select_country_screen.dart';

/// Entry Point Method
void main() async {
  /// WidgetsBinding to handle the Widget tree
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize all services
  /// Like (DependencyInjectionInit, LocalizationInit, appThemeInit, APICaller, UserToken, FirebaseInit and userData)
  await ServiceInitializer.instance.initialize();

  /// The main function that runs the main screen
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  /// Make Const Constructor For MyApp Widget
  const MyApp({Key? key}) : super(key: key);

  /// Override Build Method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Don't add any Hard Coded Like this
      title: 'Country App',

      /// Make extend class for handle theming light and dark
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SelectCountryScreen(),
    );
  }
}
