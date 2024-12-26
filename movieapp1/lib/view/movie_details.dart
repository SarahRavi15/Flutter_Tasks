import 'package:flutter/material.dart';
import 'package:movieapp1/model/moviemodel.dart';
import 'package:movieapp1/view/home_screen.dart';

class MovieDetails extends StatefulWidget {
  final MovieModel movie;
  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Details',
        ),
      ),
      body: Column(
        children: [
          MovieCard(
            dict: widget.movie,
            isDetailsScreen: true,
          ),
          Text(
            'Posters',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              itemCount: widget.movie.images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  child: Image.network(
                    widget.movie.images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
