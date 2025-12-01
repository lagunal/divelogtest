import 'package:flutter/material.dart';
import 'package:divelogtest/screens/main_navigation_screen.dart';
import 'package:divelogtest/theme.dart';
import 'package:divelogtest/services/user_service.dart';
import 'package:divelogtest/services/dive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final userService = UserService();
  final diveService = DiveService();
  
  await userService.initialize();
  await userService.createDefaultUserIfNeeded();
  
  final userId = userService.getCurrentUserId();
  if (userId != null) {
    await diveService.loadSampleData(userId);
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Buceo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const MainNavigationScreen(),
    );
  }
}
