import 'package:bloc/bloc.dart';
import 'package:country_api_application/features/data/models/country_state_model.dart';
import 'package:country_api_application/features/data/repository/country_state_city_repo.dart';
import 'package:meta/meta.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryStateCityRepo repository;
  CountryBloc(this.repository) : super(CountriesLoading()) {
    on<LoadCountries>((event, emit) async {
      emit(CountriesLoading());
      try {
        // Получаем страны и штаты
        final CountryStateModel = await repository.getCountriesStates();
        emit(CountriesLoaded(CountryStateModel.data));
      } catch (e) {
        emit(CountriesLoading());
      }
    });

    on<SelectCountry>((event, emit) async {
      emit(CitiesLoading());
      try {
        final countryStateModel = await repository.getCountriesStates();
        final selectCountry = countryStateModel.data.firstWhere(
          (country) => country.name == event.country,
        );
        emit(StatesLoaded(selectCountry.states));
      } catch (e) {
        emit(StatesLoading());
      }
    });

    on<LoadCities>((event, emit) async {
      emit(CitiesLoading());
      try {
        final citiesModel = await repository.getCities(
          country: event.country,
          state: event.state,
        );

        emit(CitiesLoaded(citiesModel.data));
      } catch (e) {
        emit(CitiesLoading());
      }
    });
  }
}
