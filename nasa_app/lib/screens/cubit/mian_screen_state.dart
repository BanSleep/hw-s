import 'package:nasa_app/models/apod_model.dart';

abstract class MainScreenState {}

class MainScreenLoading extends MainScreenState {}

class MainScreenLoaded extends MainScreenState {
  final ApodModel result;
  MainScreenLoaded({required this.result});
}

class MainScreenError extends MainScreenState {
  final String errorMsg;
  MainScreenError({required this.errorMsg});
}

