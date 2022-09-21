part of 'countries_bloc.dart';

abstract class CountriesEvent extends Equatable {
  const CountriesEvent();

  @override
  List<Object> get props => [];
}

class GetAllCountryEvent extends CountriesEvent {}

class ChangeSelectedCountryEvent extends CountriesEvent {
  final Country country;

  const ChangeSelectedCountryEvent(this.country);

  @override
  List<Object> get props => [country];
}
