import 'package:get_it/get_it.dart';
import 'package:graphql_fetch_country/countries/data/datasource/countries_datasource.dart';
import 'package:graphql_fetch_country/countries/data/repository/countries_repository.dart';
import 'package:graphql_fetch_country/countries/domain/repositories/countries_repository.dart';
import 'package:graphql_fetch_country/countries/domain/usecases/country_details_usecase.dart';
import 'package:graphql_fetch_country/countries/domain/usecases/get_all_countries_usecase.dart';
import 'package:graphql_fetch_country/countries/presentation/controller/countries_bloc.dart';

final sl = GetIt.instance;

class DependencyInjectionServices {
  init() async {
    /// Country Feature Dependency
    country();
  }

  void country() {
    /// Bloc
    sl.registerFactory(
      () => CountriesBloc(sl(), sl()),
    );
    // Repositories
    sl.registerLazySingleton<BaseCountriesRepository>(
        () => CountriesRepository(sl()));

    // use cases
    sl.registerLazySingleton(() => GetAllCountriesUseCase(sl()));
    sl.registerLazySingleton(() => CountryDetailsUseCase(sl()));

    // Data Source
    sl.registerLazySingleton<BaseCountriesDataSource>(
        () => CountriesDataSource());
  }
}
