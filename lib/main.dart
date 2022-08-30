import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel',
      theme: ThemeData.dark().copyWith(
        textTheme: Theme.of(context)
            .textTheme
            .apply(
              bodyColor: Colors.white,
            )
            .copyWith(
              headline6: const TextStyle(
                color: Color(0xFF333333),
                fontWeight: FontWeight.normal,
              ),
            ),
      ),
      home: const HomeScreen(),
    );
  }
}
