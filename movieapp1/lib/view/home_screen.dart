import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movieapp1/model/moviemodel.dart';
import 'package:movieapp1/view/movie_details.dart';
import 'package:movieapp1/viewmodel/movie_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var ages = <int>[14, 28, 30];

  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies List'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movieData.moviesList.length,
          itemBuilder: (context, index) {
            final dict = movieData.moviesList[index];
            return MovieCard(dict: dict);
            // return ListTile(
            //   title: Text(dict.title),
            //   subtitle: Text('Cast: $dict.actors'),
            //   trailing: Icon(Icons.arrow_circle_right_outlined),
            //   leading: CircleAvatar(
            //     child: Text(
            //       dict.title[0],
            //     ),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.dict,
    this.isDetailsScreen = false,
  });

  final MovieModel dict;
  final bool isDetailsScreen;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          dict.title,
        ),
        subtitle: Text('Cast: ${dict.actors}'),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(dict.images[0]),
        ),
        children: [
          Container(
            padding: EdgeInsets.only(left: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: 'Released on: ',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '${dict.released}\n',
                      ),
                      TextSpan(
                        text: 'Plot :  ',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '${dict.plot}',
                      ),
                    ],
                  ),
                ),
                isDetailsScreen
                    ? Text("")
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetails(movie: dict)));
                        },
                        child: Text('Read more...'),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
