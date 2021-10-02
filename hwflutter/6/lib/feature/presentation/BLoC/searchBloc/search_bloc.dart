import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw6/core/error/failure.dart';
import 'package:hw6/feature/domain/entities/person_enity.dart';
import 'package:hw6/feature/domain/usecases/search_person.dart';
import 'package:hw6/feature/presentation/BLoc/seacrhBloc/search_event.dart';
import 'package:hw6/feature/presentation/BLoc/seacrhBloc/search_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({required this.searchPerson}) : super(PersonSearchEmpty());
  int page = 1;

  @override
  Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
    if (event is SearchPersons) {
      yield* _mapFetchPersonsToState(event.personQuery);
    }
  }

  Stream<PersonSearchState> _mapFetchPersonsToState(String personQuery) async* {
    final currentState = state;
    var oldPerson = <PersonEntity>[];
    if(currentState is PersonSearchLoaded) {
      oldPerson = currentState.persons;
    }
    yield PersonSearchLoading(oldPerson, isFirstFetch: page == 1);
    print(page);

    final failureOrPerson =
    await searchPerson(SearchPersonParams(query: personQuery, page: page));

    yield failureOrPerson.fold(
            (failure) => PersonSearchError(message: _mapFailureToMessage(failure)),
            (person) {
              page++;
              print(page);
              final persons = (state as PersonSearchLoading).oldPersonsList;
              persons.addAll(person);
              print('List length ${persons.length}');
              return PersonSearchLoaded(persons: persons);
            });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}