import 'package:dartz/dartz.dart';
import 'package:graphql_fetch_country/core/error/failure.dart';

/// Make abstract UseCase using for all useCases (with param or without )
abstract class BaseUseCases<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

abstract class BaseUseCasesNoParam<T> {
  Future<Either<Failure, T>> call();
}
