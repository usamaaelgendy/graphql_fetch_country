import 'package:dartz/dartz.dart';
import 'package:graphql_fetch_country/core/error/failure.dart';
import 'package:graphql_fetch_country/core/usecases/usecases.dart';
import 'package:graphql_fetch_country/countries/domain/entities/country.dart';
import 'package:graphql_fetch_country/countries/domain/repositories/countries_repository.dart';

class GetAllCountriesUseCase extends BaseUseCasesNoParam<List<Country>> {
  /// inject repository in constructor (contract repository)
  final BaseCountriesRepository baseCountriesRepository;

  GetAllCountriesUseCase(this.baseCountriesRepository);

  /// Callable class to call UseCase
  @override
  Future<Either<Failure, List<Country>>> call() async {
    return await baseCountriesRepository.getAllCountries();
  }
}
