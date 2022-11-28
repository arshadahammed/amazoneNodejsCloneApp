import 'package:amazone_clone_tutorial/common/widgets/bottom-bar.dart';
import 'package:amazone_clone_tutorial/constants/global_variables.dart';
import 'package:amazone_clone_tutorial/features/admin/screen/admin_screen.dart';
import 'package:amazone_clone_tutorial/features/auth/screens/auth_screen.dart';
import 'package:amazone_clone_tutorial/features/auth/services/auth_service.dart';
import 'package:amazone_clone_tutorial/provider/user_provider.dart';
import 'package:amazone_clone_tutorial/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amazone Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoutes(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}

// onGenerateRoute: (settings) => generateRoutes(settings),
//       home: Provider.of<UserProvider>(context).user.token.isNotEmpty
//           ? Provider.of<UserProvider>(context).user.type == 'user'
//               ? const BottomBar()
//               : const AdminScreen()
//           : const AuthScreen(),
