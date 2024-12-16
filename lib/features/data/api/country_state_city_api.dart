import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../models/cities_model.dart';
import '../models/country_state_model.dart';

class CountryStateCityApi {
  static const countriesStateURL =
      'https://countriesnow.space/api/v0.1/countries/states';
  static const cityURL =
      'https://countriesnow.space/api/v0.1/countries/state/cities/q?country';

  CountryStateCityApi(Dio dio);

  Future<CountryStateModel> getCountriesStates() async {
    try {
      var url = Uri.parse(countriesStateURL);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return CountryStateModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      throw Exception('Error fetching countries and states: $e');
    }
  }

  Future<CitiesModel> getCities({
    required String country,
    required String state,
  }) async {
    try {
      var url = Uri.parse("$cityURL=$country&state=$state");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return CitiesModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load cities');
      }
    } catch (e) {
      throw Exception('Error fetching cities: $e');
    }
  }
}
