import 'package:flutter/material.dart';
import 'model/movie.dart';

class MovieListView extends StatelessWidget {
  MovieListView({super.key});

  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zita Movies"),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      backgroundColor: Colors.red.shade900,
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Positioned(child: movieCard(movieList[index], context)),
              Positioned(
                top: 10.0,
                bottom: 10.0,
                child: movieImage(movieList[index].images[2]),
              ),
            ],
          );
        },
      ),
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
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        movie.type,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Released: ${movie.released}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        movie.runtime,
                        style: const TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        movie.rated,
                        style: const TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieListViewDetails(
              movie: movie, // Pass the movie object
            ),
          ),
        );
      },
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {
  final Movie movie; // Use the Movie object here

  const MovieListViewDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Details"),
        backgroundColor: Colors.redAccent.shade400,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          const HorizontalLine(),
          MovieDetailsCast(movie: movie),
          const HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images,)
        ],
      ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key? key, required this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white,
            )
          ],
        ),
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[1].toString()),
          const SizedBox(
            width: 20,
          ),
          Expanded(child: MovieDetailsHeader(movie: movie))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.all(Radius.circular(10));
    return Card(
        child: ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: 160,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(poster), fit: BoxFit.cover)),
      ),
    ));
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
        Text("${movie.year} . ${movie.genre}".toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.redAccent,
            )),
         Text.rich(TextSpan(style:  const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w300,
        ),
          children: [
            TextSpan(
              text: movie.plot,
              ),
            const TextSpan(
              text: "More....", style: TextStyle( color: Colors.redAccent)
            )
          ]
        ))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie.actors),
          MovieField(field: "Director(s)", value: movie.director),
          MovieField(field: "Language", value: movie.language)
        ],

      ),
    );
  }
}
class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key? key, required this.field, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$field : ", style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Colors.redAccent,
          ),),
          Expanded(
            child: Text(value, style: const TextStyle(
              color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.w300,
            ),),
          )

        ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 0.5,
        color: Colors.grey,

      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
final List<String> posters;
  const MovieDetailsExtraPosters({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("More Movie Poster".toUpperCase(), style: const TextStyle(
            fontSize: 15,
            color: Colors.black26,
            fontWeight: FontWeight.w300
          ),),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8,),
              itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(posters[index]),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),

          ),

        )
      ],

    );
  }
}



