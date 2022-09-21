import 'package:dartz/dartz.dart';
import 'package:graphql_fetch_country/core/error/failure.dart';
import 'package:graphql_fetch_country/countries/domain/entities/country.dart';
import 'package:graphql_fetch_country/countries/domain/usecases/country_details_usecase.dart';

/// Repository contract on domain layer
/// Get all country without any restrictions (don't need any parameters)
abstract class BaseCountriesRepository {
  Future<Either<Failure, List<Country>>> getAllCountries();

  Future<Either<Failure, Country>> countryDetails(
      CountryDetailsParameter parameter);
}
