import 'package:flutter/material.dart';
import 'package:news_provider/src/providers/news_provider.dart';
import 'package:news_provider/src/screens/tabs_screen.dart';
import 'package:news_provider/src/theme/custom_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const TabsScreen(),
        theme: customTheme,
      ),
    );
  }
}
