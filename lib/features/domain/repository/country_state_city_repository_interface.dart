import 'package:country_api_application/features/domain/entity/city_entity.dart';
import 'package:country_api_application/features/domain/entity/country_entity.dart';
import 'package:country_api_application/features/domain/entity/state_entity.dart';

abstract class CountryRepository {
  Future<List<CountryEntity>> getCountries();

  Future<List<StateEntity>> getStates(String countryName);

  Future<List<CityEntity>> getCities(String countryName, String stateName);
}
