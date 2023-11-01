
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/data/models/api/repo.dart';
import 'package:rick_and_morty/data/models/results.dart';


part 'rickandmorty_state.dart';

class RickandmortyCubit extends Cubit<RickandmortyState> {
  final Repo repo;
  
  RickandmortyCubit( this.repo) : super(RickandmortyInitial());
  
  
  
  Future<void> fetchAllCharacters()async {
    try {
      emit(RickandmortyLoading());
      final cha = await repo.getAllCharacters();
      emit(RickandmortyLoaded(cha));
    }catch(e){
      emit(RickandmortyError('${e}'));

    }
    }
}
