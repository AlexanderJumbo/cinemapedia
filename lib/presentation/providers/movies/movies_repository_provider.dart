import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//*Este provider será de solo lectura - INMUTABLE
final movieRepisitoryProvider = Provider((ref) {


  return MovieRepositoryImpl(MoviedbDatasource());

});