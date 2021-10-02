import 'package:dartz/dartz.dart';
import 'package:hw6/core/error/failure.dart';
import 'package:hw6/feature/domain/entities/person_enity.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query, int page);
}