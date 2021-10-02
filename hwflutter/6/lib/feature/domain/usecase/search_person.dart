import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hw6/core/error/failure.dart';
import 'package:hw6/core/usecases/use_case.dart';
import 'package:hw6/feature/domain/entities/person_enity.dart';
import 'package:hw6/feature/domain/repository/person_repository.dart';

class SearchPerson extends UseCase<List<PersonEntity>, SearchPersonParams> {
  final PersonRepository personRepository;

  SearchPerson(this.personRepository);

  @override
  Future<Either<Failure, List<PersonEntity>>> call(
      SearchPersonParams params) async {
    return await personRepository.searchPerson(params.query, params.page);
  }
}

class SearchPersonParams extends Equatable {
  final String query;
  final int page;

  const SearchPersonParams({required this.query, required this.page});

  @override
  List<Object> get props => [query, page];
}