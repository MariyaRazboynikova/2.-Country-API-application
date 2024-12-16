import 'package:country_api_application/features/data/models/country_state_model.dart';
import 'package:country_api_application/features/data/repository/country_state_city_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Определение событий
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

// Определение состояний
abstract class CountryState {}

class CountriesLoading extends CountryState {}

class CountriesLoaded extends CountryState {
  final List<Datum> countries; // Используем Datum из модели

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

// Реализация Bloc
// class CountryBloc extends Bloc<CountryEvent, CountryState> {
//   final CountryStateCityRepo getCountries;
//   final CountryStateCityRepo getStates;
//   final GetCities getCities; // Добавьте зависимость для получения городов

//   CountryBloc(this.getCountries, this.getStates, this.getCities)
//     : super(CountriesLoading()) {
//     on<LoadCountries>((event, emit) async {
//       emit(CountriesLoading());
//       try {
//         final countries = await getCountries.execute();
//         emit(CountriesLoaded(countries));
//       } catch (e) {
//         // Обработка ошибок
//       }
//     });

//     on<SelectCountry>((event, emit) async {
//       emit(StatesLoading());
//       try {
//         final states = await getStates.execute(event.country);
//         emit(StatesLoaded(states));
//       } catch (e) {
//         // Обработка ошибок
//       }
//     });

//     on<LoadCities>((event, emit) async {
//       emit(CitiesLoading());
//       try {
//         final cities = await .execute(event.country, event.state);
//         emit(CitiesLoaded(cities));
//       } catch (e) {
//         // Обработка ошибок
//       }
//     });

//     // Добавьте другие обработчики событий аналогично...
//   }
// }
