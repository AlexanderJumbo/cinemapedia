

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String,Movie>>((ref) {
  final movieRepository = ref.watch(movieRepisitoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById); //* otra forma de llamar a la referencia de la función
});
/*
  {
    'id1': Movie(),
    'id2': Movie(),
    'id3': Movie(),
    'id4': Movie()
  }
*/

typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>>{

  final GetMovieCallback getMovie;

  MovieMapNotifier({ 
    required this.getMovie
  }): super({});

  Future<void> loadMovie(String movieId) async{
    if(state[movieId] != null) return;
    print('Realizando la petición HTTP');
    final movie = await getMovie(movieId);

    //* Creo un nuevo estado, y coloco el id de la película apuntando a {} de movie en memoria
    state = {...state, movieId: movie};
  }
}