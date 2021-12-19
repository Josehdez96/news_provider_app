import 'package:flutter/material.dart';
import 'package:news_provider/src/providers/navigation_provider.dart';
import 'package:news_provider/src/screens/tab1_screen.dart';
import 'package:news_provider/src/screens/tab2_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Just 1 provider, for more than one, use MultiProvider
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const Scaffold(
        body: _Screens(),
        bottomNavigationBar: _NavigationBar(),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: navigationProvider.currentScreen,
      onTap: (index) => navigationProvider.currentScreen = index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'For you',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Headers',
        ),
      ],
    );
  }
}

class _Screens extends StatelessWidget {
  const _Screens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return PageView(
      controller: navigationProvider.pageController,
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        Tab1Screen(),
        Tab2Screen(),
      ],
    );
  }
}
