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
        backgroundColor: Colors.redAccent.shade400,
      ),
      backgroundColor: Colors.redAccent.shade100,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 12,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    width: 200,
                      height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(movieList[index].images[2]),
                        fit: BoxFit.cover
                      ),
                        borderRadius: BorderRadius.circular(13.5),
                        color: Colors.redAccent),

                  ),
                ),
                trailing: Text(movieList[index].type),
                title: Text(
                  movieList[index].title,
                  style: TextStyle(color: Colors.red.shade700),
                ),
                subtitle: Text(movieList[index].year,
                  style: const TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieListViewDetails(movieName: movieList.elementAt(index).title,)));
                },
                //onTap: () => debugPrint("Movie Name: ${movies.elementAt(index)}"),
              ),
            );
          }),
    );
  }
  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: const Card(
          color: Colors.black45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("data")
          ],
        )
      ),
      ),
    );
  }

}

class MovieListViewDetails extends StatelessWidget {
  final String movieName;

  const MovieListViewDetails({Key? key, required this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        centerTitle: true,
        backgroundColor: Colors.redAccent.shade400,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Go Back"),
          ),
        ),
      ),
    );
  }
}
