import 'package:flutter/material.dart';
import 'package:movie_app_api/pages/movie_details_page.dart';
import 'package:movie_app_api/pages/movie_page.dart';
import 'package:movie_app_api/provider/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => MovieProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      initialRoute: MoviePage.routeName,
      routes: {
        MoviePage.routeName: (context) => MoviePage(),
        MovieDetailsPage.routeName: (context) => MovieDetailsPage(),
      },
    );
  }
}
