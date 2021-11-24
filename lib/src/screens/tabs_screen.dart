import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => _NavigationModel(),
      child: const Scaffold(
        body: _Screens(),
        bottomNavigationBar: _NavigationBar(),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentScreen,
      onTap: (index) => navigationModel.currentScreen = index,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'For you'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Headers'),
      ]
    );
  }
}

class _Screens extends StatelessWidget {
  const _Screens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        )
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentScreen = 0;
  final PageController _pageController = PageController();

  int get currentScreen => _currentScreen;

  set currentScreen(int value) {
    _currentScreen = value;
    _pageController.animateToPage(_currentScreen, duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}