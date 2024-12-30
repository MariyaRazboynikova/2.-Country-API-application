import 'package:bloc/bloc.dart';
import 'package:country_api_application/features/data/models/country_state_model.dart';
import 'package:country_api_application/features/data/repository/country_state_city_repo.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final CountryStateCityRepo repository;

  CountryBloc(this.repository) : super(CountriesLoading()) {
    on<LoadCountries>((event, emit) async {
      emit(CountriesLoading());
      try {
        // Получаем страны и состояния
        final countryStateModel = await repository.getCountriesStates();
        emit(CountriesLoaded(countryStateModel.data));
      } catch (e) {
        emit(CountriesLoading()); // Здесь можно добавить состояние ошибки
      }
    });

    on<SelectCountry>((event, emit) async {
      emit(StatesLoading());
      try {
        // Получаем состояния для выбранной страны
        final countryStateModel = await repository.getCountriesStates();
        final selectedCountry = countryStateModel.data.firstWhere(
          (country) => country.name == event.country,
        );
        emit(StatesLoaded(selectedCountry.states));
      } catch (e) {
        emit(StatesLoading()); // Здесь можно добавить состояние ошибки
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
        emit(CitiesLoading()); // Здесь можно добавить состояние ошибки
      }
    });
  }
}
