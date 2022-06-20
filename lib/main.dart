import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider_tutorial/provider/auth_provider.dart';
import 'package:state_management_provider_tutorial/provider/count_provider.dart';
import 'package:state_management_provider_tutorial/provider/example_1_slider.dart';
import 'package:state_management_provider_tutorial/provider/favorite_provider.dart';
import 'package:state_management_provider_tutorial/provider/theme_change_provider.dart';

import 'package:state_management_provider_tutorial/screens/favorite/favorite_screen.dart';
import 'package:state_management_provider_tutorial/screens/login.dart';
import 'package:state_management_provider_tutorial/screens/theme/dark_theme.dart';
import 'package:state_management_provider_tutorial/screens/value_notify_listener.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExampleOneSliderProvider()),
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChange()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: Builder(
        builder: ((context) {
          final themeChanger = Provider.of<ThemeChange>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Provider StateManagement',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red,
              iconTheme: const IconThemeData(color: Colors.red),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
              iconTheme: const IconThemeData(color: Colors.red),
            ),
            home: const LoginScreen(),
          );
        }),
      ),
    );
  }
}
