import 'package:dartz/dartz.dart';
import 'package:graphql_fetch_country/core/error/exceptions.dart';
import 'package:graphql_fetch_country/core/error/failure.dart';
import 'package:graphql_fetch_country/countries/data/datasource/countries_datasource.dart';
import 'package:graphql_fetch_country/countries/domain/entities/country.dart';
import 'package:graphql_fetch_country/countries/domain/repositories/countries_repository.dart';
import 'package:graphql_fetch_country/countries/domain/usecases/country_details_usecase.dart';

/// Concrete Implementation For Repository
class CountriesRepository extends BaseCountriesRepository {
  final BaseCountriesDataSource baseCountriesDataSource;

  CountriesRepository(this.baseCountriesDataSource);

  /// MAKE Some LOGIC HERE IF YOU NEED (Like : CACHE DATA TO Local DataSource)
  @override
  Future<Either<Failure, List<Country>>> getAllCountries() async {
    try {
      return Right(await baseCountriesDataSource.getAllCountry());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, Country>> countryDetails(
      CountryDetailsParameter parameter) async {
    try {
      return Right(await baseCountriesDataSource.countryDetails(parameter));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
