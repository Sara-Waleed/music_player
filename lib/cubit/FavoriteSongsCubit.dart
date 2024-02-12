import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/json_data.dart';

class FavoriteSongsCubit extends Cubit<List<bool>> {
  FavoriteSongsCubit() : super(List<bool>.filled(songsData.length, false));

  void toggleFavorite(int index) {
    state[index] = !state[index];
    emit(List.from(state));
  }
}
