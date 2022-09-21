import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_fetch_country/core/error/failure.dart';
import 'package:graphql_fetch_country/core/usecases/usecases.dart';
import 'package:graphql_fetch_country/countries/domain/entities/country.dart';
import 'package:graphql_fetch_country/countries/domain/repositories/countries_repository.dart';

class CountryDetailsUseCase
    extends BaseUseCases<Country, CountryDetailsParameter> {
  /// inject repository in constructor (contract repository)
  final BaseCountriesRepository baseCountriesRepository;

  CountryDetailsUseCase(this.baseCountriesRepository);

  /// Callable class to call UseCase
  @override
  Future<Either<Failure, Country>> call(
      CountryDetailsParameter parameter) async {
    return await baseCountriesRepository.countryDetails(parameter);
  }
}

class CountryDetailsParameter extends Equatable {
  final String countryCode;

  const CountryDetailsParameter({required this.countryCode});

  @override
  List<Object> get props => [countryCode];
}
