import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/features/moviedetails/domain/entities/details_entity.dart';
import 'package:movie_flutter_demo/features/moviedetails/domain/usecase/get_movie_details_usecase.dart';
import 'package:movie_flutter_demo/features/moviedetails/presentation/bloc/details_event.dart';
import 'package:movie_flutter_demo/features/moviedetails/presentation/bloc/details_state.dart';

import '../../../../core/util/resource.dart';

@injectable
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  DetailsBloc({required GetMovieDetailsUseCase getDetails})
      : getMovieDetailsUseCase = getDetails,
        super(Pending()) {
    on<GetMoviesDetailsEvent>(
      (event, emit) async {
        final Resource<DetailsEntity> movieDetailsEntityResource =
            await getMovieDetailsUseCase(event.movieId);

        final result = movieDetailsEntityResource.when(
          data: (data) {
            return data;
          },
          error: (error) {
            return null;
          },
          pending: () {
            return null;
          },
        );

        if (result == null) {
          emit(ErrorState());
          return;
        }

        emit(LoadedState(detailsEntity: result));
      },
    );
  }

  getMoviesDetails(String movieId) {
    add(GetMoviesDetailsEvent(movieId));
  }
}
