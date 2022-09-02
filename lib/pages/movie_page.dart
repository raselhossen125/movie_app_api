// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:movie_app_api/pages/movie_details_page.dart';
import 'package:movie_app_api/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatefulWidget {
  static const routeName = '/';

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late MovieProvider provider;
  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      provider = Provider.of<MovieProvider>(context);
      _getData();
      isInit = false;
    }
    super.didChangeDependencies();
  }

  void _getData() {
    try {
      provider.getMovieData();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final response = provider.movieModel;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 35),
        Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Movie List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        provider.movieModel != null
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.77),
                    itemCount: response!.data!.movies!.length,
                    itemBuilder: (context, index) {
                      final movieM = response.data!.movies![index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              MovieDetailsPage.routeName,
                              arguments: movieM);
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              movieM.largeCoverImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            : Center(
                child: Text('No Data Found'),
              ),
      ],
    ));
  }
}
