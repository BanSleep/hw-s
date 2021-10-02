import 'package:dartz/dartz.dart';
import 'package:hw6/core/error/exception.dart';
import 'package:hw6/core/error/failure.dart';
import 'package:hw6/core/platform/network_info.dart';
import 'package:hw6/feature/data/datasources/person_local_data_source.dart';
import 'package:hw6/feature/data/datasources/person_remote_data_source.dart';
import 'package:hw6/feature/data/models/person_model.dart';
import 'package:hw6/feature/domain/entities/person_enity.dart';
import 'package:hw6/feature/domain/repository/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonRemoteDataSource remoteDataSource;
  final PersonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) async {
    return await _getPersons(() {
      return remoteDataSource.getAllPersons(page);
    });
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query, int page) async {

    return await _getPersons(() {
      return remoteDataSource.searchPerson(query, page);
    });
  }

  Future<Either<Failure, List<PersonModel>>> _getPersons(
      Future<List<PersonModel>> Function() getPersons) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await getPersons();
        localDataSource.personsToCache(remotePerson);
        return Right(remotePerson);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPerson = await localDataSource.getLastPersonsFromCache();
        return Right(localPerson);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}