abstract class DetailsEvent {

}
class GetMoviesDetailsEvent extends DetailsEvent {
  final String movieId;

  GetMoviesDetailsEvent(this.movieId);
}