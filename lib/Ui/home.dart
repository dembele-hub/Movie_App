import 'package:flutter/material.dart';

import 'model/movie.dart';

class MovieListView extends StatelessWidget {
  MovieListView({super.key});

  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      backgroundColor: Colors.red.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              Positioned(child: movieCard(movieList[index], context)),
              Positioned(
                  top: 10.0,
                  bottom: 10.0,
                  child: movieImage(movieList[index].images[2])),
            ]);
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
            color: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              movie.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                  color: Colors.white),
                            ),
                          ),
                          Text(movie.type, style: const TextStyle(
                              fontSize: 15,
                             color: Colors.grey),)
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Released: ${movie.released}", style: const TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic,
                            color: Colors.grey),
                        ),
                        Text(movie.runtime, style: const TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic,
                            color: Colors.grey)),
                        Text(movie.rated, style: const TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic,
                            color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.title,
                    )));
      },
    );
  }

  Widget movieImage(String ImageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(ImageUrl), fit: BoxFit.cover)),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {
  final String movieName;

  const MovieListViewDetails({Key? key, required this.movieName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        centerTitle: true,
        backgroundColor: Colors.redAccent.shade400,
      ),
    body: ListView(
      children: const [
        

      ],
    ),
    );
  }
}
class MovieDetailThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailThumbnail({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [],
    );
  }
}
