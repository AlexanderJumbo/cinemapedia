

//*No se podrá crear instancias de esta clase porque es abstracta
//* Aquí se define los  orígenes de datos, movieDB, imdb, etc
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {

  Future<List<Movie>> getNowPlaying({int page = 1});

}