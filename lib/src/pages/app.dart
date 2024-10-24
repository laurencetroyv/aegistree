import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aegistree/src/components/text/inknut_antiqua.dart';
import 'package:aegistree/src/entities/user_entity.dart';
import 'package:aegistree/src/pages/app/diagnose.dart';
import 'package:aegistree/src/providers/users_provider.dart';

import 'app/dashboard.dart';
import 'app/learn.dart';
import 'app/profile.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  int _index = 0;

  static final List _body = [
    const Dashboard(),
    const Diagnose(),
    const Learn(),
    const Profile(),
  ];

  void _onNavIconTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  void _onMenuIconTapped() {}

  @override
  Widget build(BuildContext context) {
    UserEntity user = ref.read(usersProviderProvider);

    final avatarIcon = CircleAvatar(
      backgroundImage: NetworkImage(user.avatar),
      radius: 24,
    );

    const learningResources = InknutAntiqua(
      "Learning Resources",
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );

    final appBar = AppBar(
      title: _index != 2 ? avatarIcon : learningResources,
      actions: [
        IconButton(onPressed: _onMenuIconTapped, icon: const Icon(Icons.menu))
      ],
    );

    PreferredSizeWidget? showAppBar() {
      if (_index == 1 || _index == 3) {
        return null;
      } else {
        return appBar;
      }
    }

    return Scaffold(
      appBar: showAppBar(),
      body: _body[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            label: 'Diagnose',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _index,
        selectedItemColor: const Color(0xFF48BD1F),
        unselectedItemColor: Colors.grey,
        onTap: _onNavIconTapped,
      ),
    );
  }
}
