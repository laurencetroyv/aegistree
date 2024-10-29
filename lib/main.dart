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
    final user = ref.watch(usersProvider);

    return MaterialApp(
      title: kAppTitle,
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      home: _route(user),
    );
  }

  Widget _route(UserEntity? user) {
    if (user == null) {
      return const WelcomeScreen();
    } else if (user.avatar == null) {
      return const UserWelcomeScreen();
    } else {
      return const App();
    }
  }
}
