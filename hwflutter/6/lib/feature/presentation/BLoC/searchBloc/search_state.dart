import 'package:equatable/equatable.dart';
import 'package:hw6/feature/domain/entities/person_enity.dart';

abstract class PersonSearchState extends Equatable {
  const PersonSearchState();

  @override
  List<Object> get props => [];
}

class PersonSearchEmpty extends PersonSearchState {}

class PersonSearchLoading extends PersonSearchState {
  final List<PersonEntity> oldPersonsList;
  bool isFirstFetch;
  PersonSearchLoading(this.oldPersonsList, {this.isFirstFetch = false});
  @override
  List<Object> get props => [oldPersonsList];
}

class PersonSearchLoaded extends PersonSearchState {
  final List<PersonEntity> persons;

  const PersonSearchLoaded({required this.persons});

  @override
  List<Object> get props => [persons];
}

class PersonSearchError extends PersonSearchState {
  final String message;

  const PersonSearchError({required this.message});

  @override
  List<Object> get props => [message];
}