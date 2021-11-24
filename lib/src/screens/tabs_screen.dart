import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Screens(),
      bottomNavigationBar: _NavigationBar(),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
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
    return PageView(
      // physics: const BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
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