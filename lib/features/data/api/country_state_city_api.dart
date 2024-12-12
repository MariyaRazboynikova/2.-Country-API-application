import 'package:dio/dio.dart';

class CountryStateCityApi {
  static const countriesStateURL =
      'https://countriesnow.space/api/v0.1/countries/states';
  static const cityURL =
      'https://countriesnow.space/api/v0.1/countries/state/cities/q?country';

  CountryStateCityApi(Dio dio);

  Future<CountryStateCityApi>
}
