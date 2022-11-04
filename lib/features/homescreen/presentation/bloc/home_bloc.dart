import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_flutter_demo/core/util/resource.dart';
import 'package:movie_flutter_demo/features/homescreen/domain/entities/movies_category_entiy.dart';
import 'package:movie_flutter_demo/features/homescreen/presentation/vo/movie_vo.dart';
import '../../domain/usecases/get_movie_category.dart';
import '../../domain/usecases/get_movie_list.dart';
import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final GetMovieCategory getMovieCategory;
  final GetMovieList getMovieList;

  HomeBloc({
    required GetMovieCategory category,
    required GetMovieList movies,
  })  : getMovieCategory = category,
        getMovieList = movies,
        super(Pending()) {
    on<LoadInitialDataEvent>(
      (event, emit) async {
        final Resource<List<MovieCategoryData>> movieCategoryListResource =
            await getMovieCategory();

        final result = movieCategoryListResource.when(
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

        List<MovieCategoryData> categories = result;

        if (categories.isEmpty) {
          emit(ErrorState());
          return;
        }

        emit(LoadedState(
          categories: categories,
          movieVo: Resource.pending(),
        ));

        final firstCategory = categories.first;

        final movieListResource = await getMovieList(firstCategory.movieCat);

        if (movieListResource.error != null) {
          emit(ErrorState());
        }

        final moviesList = movieListResource.when(
          data: (data) {
            final mlist = data
                .map((e) => (Movie(
                    id: e.id!,
                    poster: e.poster!,
                    name: e.name!,
                    des: e.description!,
                    rating: e.rating!,
                    isLike: false)))
                .toList();
            final list = MovieVo(list: mlist);

            list.list.where((element) => element.id == "m1").toList();
            return Resource.data(list);
          },
          error: (error) {
            return null;
          },
          pending: () {
            return null;
          },
        );

        emit(LoadedState(
          categories: categories,
          movieVo: moviesList!,
        ));
      },
    );

    /*on<GetMoviesForCategoryEvent>(
      (event, emit) async {
        final currentState = state;

        if (currentState is! LoadedState) return;

        final categories = currentState.categories;

        emit(LoadedState(
          categories: categories,
          movieVo: Resource.pending(),
        ));

        final movieListResource = await getMovieList(event.catName);

        if (movieListResource.error != null) {
          emit(ErrorState());
        }

        emit(LoadedState(
          categories: categories,
          movieVo: movieListResource,
        ));
      },
    );*/

    add(LoadInitialDataEvent());

    on<RedirectToDetails>((event, emit) {
      final currentState = state;
      if (currentState is! LoadedState) return;

      emit(RedirectToDetailsState(event.movieId,event.isLike));
      emit(currentState);
    });

    on<LikeEvent>((event, emit) {
      final currentState = state;
      if (currentState is! LoadedState) return;

      currentState.movieVo.when(
          data: (data) {

            final updatedList = data.list.map((e) {
             final a =  e.id == event.movieId
                  ? Movie(
                      id: e.id,
                      poster: e.poster,
                      name: e.name,
                      des: e.des,
                      rating: e.rating,
                      isLike: e.isLike == true? false : true)
                  : Movie(
                      id: e.id,
                      poster: e.poster,
                      name: e.name,
                      des: e.des,
                      rating: e.rating,
                      isLike: e.isLike);
              return a;
            }).toList();

            // print(updatedList);  print('${updatedList.length}');

            emit(LoadedState(categories: currentState.categories, movieVo: Resource.data(data.copyWith.call(list: updatedList))));
          },
          error: (error) {},
          pending: () {});
    });
  }

  getMovies(String selectedCat) {
    add(GetMoviesForCategoryEvent(selectedCat));
  }

  redirectToDetails(String movieId,bool isLike) {
    add(RedirectToDetails(movieId,isLike));
  }

  likeMovie(String movieId) {
    add(LikeEvent(movieId));
  }
}
