

import 'package:cinemapedia/domain/entities/movie.dart';
import 'movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//* Provider de solo lectura, que nos permita leer cada vez que se cargan las películas y extraer solo las primeras 6
//* y usarlo sin tener que estar escribiendo esta lógica varias veces en distintos widgets
final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
  if(nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0,6);
});