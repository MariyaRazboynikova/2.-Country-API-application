part of 'country_bloc.dart';

abstract class CountryEvent {}

class LoadCountries extends CountryEvent {}

class SelectCountry extends CountryEvent {
  final String country;

  SelectCountry(this.country);
}

class LoadStates extends CountryEvent {
  final String country;

  LoadStates(this.country);
}

class LoadCities extends CountryEvent {
  final String country;
  final String state;

  LoadCities(this.country, this.state);
}
