import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  MovieListView({super.key});
  //final List<Movie> movieList = Movie.getMovies();

  final List movies = [
    "Spider-Man: Across the Spider-Verse (2023)",
    "John Wick 4 (2023)",
    "Heart of Stone (2023)",
    "Avengers: Endgame (2018)",
    "Avatar: The Way of Water (2023)",
    "Hidden Strike (2023)",
    "Extraction 2 (2023)",
    "The Mother (2023)",
    "Viking Wolf (2022)",
    "Th Grey Man (2022)",
    "Interceptor (2022)",
    "Carter (2017)",
    "Spider Head (2022)",
    "Titanic (1997)",
    "The Avengers (2018)",
    "Game of Thrones (2020)",
    "Everything Everywhere All at Once (2022)",
    "300 (2005)",
    "Love and Fire (2020)",
    "Blood Sisters (2022)",
    "Heart of Gold (2022)",
    "Top Gun: Maverick (2022)",
    "The Batman (2016)",
    "Jurassic World (2015)",
    "The Lion King (2019)",
    "Joker (2019)",
  ];

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
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 12,
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.5),
                        color: Colors.redAccent),
                    child: const Text("M"),
                  ),
                ),
                trailing: const Text("220mb"),
                title: Text(
                  movies[index],
                  style: TextStyle(color: Colors.red.shade700),
                ),
                subtitle: const Text(
                  "Good Movie",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MovieListViewDetails(movieName: "Hello",)));
                },
                //onTap: () => debugPrint("Movie Name: ${movies.elementAt(index)}"),
              ),
            );
          }),
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
            child: const Text("Go Back"),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
