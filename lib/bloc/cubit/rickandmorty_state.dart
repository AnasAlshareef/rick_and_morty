part of 'rickandmorty_cubit.dart';

@immutable
abstract class RickandmortyState {}

class RickandmortyInitial extends RickandmortyState {}
class RickandmortyLoading extends RickandmortyState {}
class RickandmortyLoaded extends RickandmortyState {
  final List<Results> results;

  RickandmortyLoaded(this.results);
}
class RickandmortyError extends RickandmortyState {
  final String? message;
  RickandmortyError(this.message);
}
