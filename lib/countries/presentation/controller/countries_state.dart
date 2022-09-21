part of 'countries_bloc.dart';

class CountriesState extends Equatable {
  const CountriesState({
    this.countriesList = const [],
    this.getAllCountryState = RequestState.loading,
    this.countryDetailsState = RequestState.loaded,
    this.errorMessage = '',
    this.selectedCountry,
    this.countryDetails,
  });

  final List<Country> countriesList;
  final Country? selectedCountry;
  final Country? countryDetails;
  final RequestState getAllCountryState;
  final RequestState countryDetailsState;
  final String errorMessage;

  CountriesState copyWith({
    List<Country>? countriesList,
    RequestState? getAllCountryState,
    RequestState? countryDetailsState,
    String? errorMessage,
    Country? selectedCountry,
    Country? countryDetails,
  }) {
    return CountriesState(
      countriesList: countriesList ?? this.countriesList,
      getAllCountryState: getAllCountryState ?? this.getAllCountryState,
      countryDetailsState: countryDetailsState ?? this.countryDetailsState,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      countryDetails: countryDetails ?? this.countryDetails,
    );
  }

  @override
  List<Object?> get props => [
        countriesList,
        getAllCountryState,
        countryDetailsState,
        errorMessage,
        selectedCountry,
        countryDetails,
      ];
}
