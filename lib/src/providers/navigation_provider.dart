import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentScreen = 0;
  final PageController _pageController = PageController();

  int get currentScreen => _currentScreen;

  set currentScreen(int value) {
    _currentScreen = value;
    _pageController.animateToPage(
      _currentScreen,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
