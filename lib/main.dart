import 'package:flutter/material.dart';
import 'package:movies/movies/presentation/screens/movies_screen.dart';
import 'package:movies/movies/presentation/screens/see_more_popular_screen.dart';

import 'core/services/services_locator.dart';

void main() {
  runApp(const MyApp());
  ServicesLocator().setupLocator();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home:SeeMorePopularScreen()
       home: MainMoviesScreen(),
    );
  }
}
