import 'package:movie_flutter_demo/features/moviedetails/domain/entities/details_entity.dart';

abstract class DetailsState {

}

class Pending extends DetailsState {

}

class ErrorState extends DetailsState{

}

class LoadedState extends DetailsState {

  final DetailsEntity detailsEntity;

  LoadedState({required this.detailsEntity});
}