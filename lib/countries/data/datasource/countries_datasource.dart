import 'package:graphql/client.dart';
import 'package:graphql_fetch_country/core/network/graphql_caller.dart';
import 'package:graphql_fetch_country/core/network/query_options_selection.dart';
import 'package:graphql_fetch_country/countries/data/models/country_model.dart';
import 'package:graphql_fetch_country/countries/domain/entities/country.dart';
import 'package:graphql_fetch_country/countries/domain/usecases/country_details_usecase.dart';

/// DataSource Contract contain all abstract methods and return type only
/// if we have any Parameter we can send this here
abstract class BaseCountriesDataSource {
  Future<List<Country>> getAllCountry();

  Future<Country> countryDetails(CountryDetailsParameter parameter);
}

class CountriesDataSource extends BaseCountriesDataSource {
  /// Concrete Implementation For dataSource contract
  /// Calling data from here (Rest API, GraphQl, Local or any dataSource)
  @override
  Future<List<Country>> getAllCountry() async {
    final result = await GraphQlCaller().requestQuery(
      QueryOptions(
        document: gql(QueryOptionsSelection.countryQuery),
      ),
    );

    /// Convert Json Data to model using CountryModel
    /// using factory constructor (Design pattern)
    /// then add models to list and return List<Entities>
    return List.from(result["countries"].map((e) => CountryModel.fromJson(e)));
  }

  @override
  Future<Country> countryDetails(CountryDetailsParameter parameter) async {
    final result = await GraphQlCaller().requestQuery(
      QueryOptions(
          document: gql(QueryOptionsSelection.countryDetailsQuery),
          variables: {
            "code": parameter.countryCode,
          }),
    );

    /// Convert Json Data to model using CountryModel
    /// using factory constructor (Design pattern)
    /// then add models to list and return List<Entities>
    return CountryModel.fromJson(result["country"]);
  }
}
