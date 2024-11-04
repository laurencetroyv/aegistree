import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aegistree/src/src.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DependencyInjector().init();

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return MaterialApp(
      title: kAppTitle,
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      home: switch (authState) {
        AuthInitial() => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        Authenticated(user: final user) => _route(user),
        Unauthenticated() => const WelcomeScreen(),
        AuthError(message: final message) => Scaffold(
            body: Center(
              child: Text(message),
            ),
          ),
      },
    );
  }

  Widget _route(UserEntity user) {
    if (user.avatar == null) {
      return const UserWelcomeScreen();
    } else {
      return const App();
    }
  }
}
