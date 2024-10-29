import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:aegistree/src/src.dart';

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

  void _onMenuIconTapped() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Koho(kUnimplementedFeature)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(usersProvider)!;

    final avatarIcon = CircleAvatar(
      backgroundImage: user.avatar != null
          ? MemoryImage(user.avatar!)
          : const AssetImage('assets/images/temp_profile.png'),
      radius: kXtraLarge,
    );

    const learningResources = InknutAntiqua(
      kLearningResources,
      fontSize: kLarge,
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
            label: kDashboard,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_camera),
            label: kDiagnose,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library),
            label: kLearn,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: kProfile,
          ),
        ],
        currentIndex: _index,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onNavIconTapped,
      ),
    );
  }
}
