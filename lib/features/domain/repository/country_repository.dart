import 'package:country_api_application/features/domain/entity/city.dart';
import 'package:country_api_application/features/domain/entity/country.dart';
import 'package:country_api_application/features/domain/entity/state.dart';

abstract class CountryRepository {
  Future<List<CountryEntity>> getCountries();

  Future<List<StateEntity>> getStates(String countryName);

  Future<List<CityEntity>> getCities(String countryName, String stateName);
}
