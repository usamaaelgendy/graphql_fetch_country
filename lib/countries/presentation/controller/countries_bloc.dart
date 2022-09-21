import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_fetch_country/core/utils/utils.dart';
import 'package:graphql_fetch_country/countries/domain/entities/country.dart';
import 'package:graphql_fetch_country/countries/domain/usecases/country_details_usecase.dart';
import 'package:graphql_fetch_country/countries/domain/usecases/get_all_countries_usecase.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetAllCountriesUseCase getAllCountriesUseCase;
  final CountryDetailsUseCase countryDetailsUseCase;

  CountriesBloc(this.getAllCountriesUseCase, this.countryDetailsUseCase)
      : super(const CountriesState()) {
    on<GetAllCountryEvent>(_getAllCountryEvent);
    on<ChangeSelectedCountryEvent>(_changeSelectedCountryEvent);
  }

  FutureOr<void> _getAllCountryEvent(
      GetAllCountryEvent event, Emitter<CountriesState> emit) async {
    (await getAllCountriesUseCase()).fold(
      (l) => emit(
        state.copyWith(
            errorMessage: l.message, getAllCountryState: RequestState.error),
      ),
      (r) => emit(
        state.copyWith(
          countriesList: r,
          getAllCountryState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _changeSelectedCountryEvent(
      ChangeSelectedCountryEvent event, Emitter<CountriesState> emit) async {
    emit(state.copyWith(
      selectedCountry: event.country,
      countryDetailsState: RequestState.loading,
    ));
    (await countryDetailsUseCase(
            CountryDetailsParameter(countryCode: event.country.code)))
        .fold(
      (l) => emit(
        state.copyWith(
            countryDetailsState: RequestState.error, errorMessage: l.message),
      ),
      (r) => emit(
        state.copyWith(
          countryDetailsState: RequestState.loaded,
          countryDetails: r,
        ),
      ),
    );
  }
}
