
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw6/core/error/failure.dart';
import 'package:hw6/feature/domain/entities/person_enity.dart';
import 'package:hw6/feature/domain/usecases/get_all_persons.dart';
import 'package:hw6/feature/presentation/BLoc/personListCubit/person_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PersonListCubit extends Cubit<PersonState> {
  final GetAllPersons getAllPersons;

  PersonListCubit({required this.getAllPersons}) : super(PersonEmpty());

  int page = 1;

  void loadPerson() async {
    if (state is PersonLoading) return;

    final currentState = state;

    var oldPerson = <PersonEntity>[];
    if (currentState is PersonLoaded) {
      oldPerson = currentState.personsList;
    }

    emit(PersonLoading(oldPerson, isFirstFetch: page == 1));


    final failureOrPerson = await getAllPersons(PagePersonParams(page: page));
    failureOrPerson.fold(
            (error) => emit(PersonError(message: _mapFailureToMessage(error))),
            (character) {
          page++;
          print(page);
          final persons = (state as PersonLoading).oldPersonsList;
          persons.addAll(character);
          print('List length: ${persons.length.toString()}');
          emit(PersonLoaded(persons));
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