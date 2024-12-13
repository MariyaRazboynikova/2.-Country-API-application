import 'package:country_api_application/features/data/api/country_state_city_api.dart';
import 'package:country_api_application/features/data/models/city_model.dart';
import 'package:country_api_application/features/data/models/country_state_model.dart';

class CountryStateCityRepo {
  final CountryStateCityApi api;

  CountryStateCityRepo(this.api);

  Future<CountryStateModel> getCountriesStates() async {
    return await api.getCountriesStates();
  }

  Future<CitiesModel> getCities({
    required String country,
    required String state,
  }) async {
    return await api.getCities(country: country, state: state);
  }
}
