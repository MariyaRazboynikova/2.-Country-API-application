part of 'country_bloc.dart';

@immutable
abstract class CountryState {}

class CountriesLoading extends CountryState {}

class CountriesLoaded extends CountryState {
  final List<Datum> countries;

  CountriesLoaded(this.countries);
}

class StatesLoading extends CountryState {}

class StatesLoaded extends CountryState {
  final List<State> states;

  StatesLoaded(this.states);
}

class CitiesLoading extends CountryState {}

class CitiesLoaded extends CountryState {
  final List<String> cities;

  CitiesLoaded(this.cities);
}
