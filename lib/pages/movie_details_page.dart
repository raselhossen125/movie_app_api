// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:movie_app_api/model/movie_model.dart';
import 'package:movie_app_api/utils/helper_function.dart';

class MovieDetailsPage extends StatefulWidget {
  static const routeName = 'details';

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late Movies movies;
  @override
  void didChangeDependencies() {
    movies = ModalRoute.of(context)!.settings.arguments as Movies;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 35),
          Container(
            height: 70,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 26,
                    )),
                SizedBox(width: 15),
                Text(
                  movies.title.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  child: Image.network(movies.largeCoverImage!, fit: BoxFit.fitHeight,),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title : ${movies.titleLong!}', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),),
                        Text('Rating : ${movies.rating!.toDouble()}', style: TextStyle(
                          fontSize: 18,
                        ),),
                        Text('Runtime : $getFormattedDateTime${movies.runtime!}  )', style: TextStyle(
                          fontSize: 18,
                        ),),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
