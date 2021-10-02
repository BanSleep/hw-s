import 'package:dartz/dartz.dart';
import 'package:hw6/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}