


import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch(actorsRepisitoryProvider);
  return ActorsByMovieNotifier(
      getActors: actorsRepository.getActorsByMovie); //* otra forma de llamar a la referencia de la función
});
/*
  {
    'id1': <Actor>[],
    'id2': <Actor>[],
    'id3': <Actor>[],
    'id4': <Actor>[]
  }
*/

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    //* Si ya tenemos en memoria un Map con ese id de película, entonces ya no volvemos a hacer la petición
    if (state[movieId] != null) return;
    final actors = await getActors(movieId);

    //* Creo un nuevo estado, y coloco el id de la película apuntando a {} de movie en memoria
    state = {...state, movieId: actors};
  }
}
