import 'package:country_api_application/features/data/api/country_state_city_api.dart';
import 'package:country_api_application/features/data/models/country_state_model.dart';
import 'package:country_api_application/features/data/repository/country_state_city_repo.dart';
import 'package:country_api_application/features/domain/entity/state_entity.dart';
import 'package:country_api_application/features/presentation/bloc/country_bloc.dart';
import 'package:country_api_application/features/presentation/pages/country_detailes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountyPage extends StatelessWidget {
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  CountyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Country State City',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create:
            (context) =>
                CountryBloc(CountryStateCityRepo(CountryStateCityApi(Dio())))
                  ..add(LoadCountries()),
        child: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountriesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CountriesLoaded) {
              return _buildCountryDropdown(context, state.countries);
            } else if (state is StatesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is StatesLoaded) {
              return Column(
                children: [
                  _buildStateDropdown(
                    context,
                    state.states
                        .map(
                          (s) =>
                              StateEntity(name: s.name, stateCode: s.stateCode),
                        )
                        .toList(),
                  ),
                  // Добавляем проверку на состояние CitiesLoaded
                  if (selectedState != null)
                    BlocBuilder<CountryBloc, CountryState>(
                      builder: (context, cityState) {
                        if (cityState is CitiesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (cityState is CitiesLoaded) {
                          return _buildCityDropdown(context, cityState.cities);
                        } else {
                          return const SizedBox(); // Пустой виджет, если нет городов
                        }
                      },
                    ),
                ],
              );
            } else if (state is CitiesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CitiesLoaded) {
              return _buildCityDropdown(context, state.cities);
            } else {
              return const Center(child: Text('Error loading data'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CountryBloc>().add(LoadCountries());
        },
        child: const Icon(Icons.refresh),
        tooltip: 'Load Countries',
      ),
    );
  }

  Widget _buildCountryDropdown(BuildContext context, List<Datum> countries) {
    List<String> countryNames =
        ['Select Country'] + countries.map((country) => country.name).toList();

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedCountry ?? 'Select Country',

      style: TextStyle(
        color: Theme.of(context).colorScheme.onSecondary,
      ), // Цвет текста
      items:
          countryNames.map((String country) {
            return DropdownMenuItem<String>(
              value: country,
              child: Text(
                country,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ), // Жирный текст для элементов
              ),
            );
          }).toList(),
      onChanged: (selectedValue) {
        if (selectedValue != null && selectedValue != 'Select Country') {
          selectedCountry = selectedValue;
          context.read<CountryBloc>().add(SelectCountry(selectedValue));
          selectedState = null;
          selectedCity = null;
        }
      },
    );
  }

  Widget _buildStateDropdown(BuildContext context, List<StateEntity> states) {
    List<String> stateNames =
        ['Select State'] + states.map((state) => state.name).toList();

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedState ?? 'Select State',
      items:
          stateNames.map((String state) {
            return DropdownMenuItem<String>(value: state, child: Text(state));
          }).toList(),
      onChanged: (selectedValue) {
        if (selectedValue != null && selectedValue != 'Select State') {
          selectedState = selectedValue;
          context.read<CountryBloc>().add(
            LoadCities(selectedCountry!, selectedValue),
          ); // Загружаем города
          selectedCity =
              null; // Сбрасываем выбранный город при выборе нового штата
        }
      },
    );
  }

  Widget _buildCityDropdown(BuildContext context, List<String> cities) {
    String? selectedCity; // Переменная для выбранного города

    List<String> cityNames = ['Select City'] + cities;

    return DropdownButton<String>(
      isExpanded: true,
      value: selectedCity ?? 'Select City',
      items:
          cityNames.map((String city) {
            return DropdownMenuItem<String>(value: city, child: Text(city));
          }).toList(),
      onChanged: (selectedValue) {
        if (selectedValue != null && selectedValue != 'Select City') {
          // Переход на страницу с информацией о выбранном городе
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => CountryDetailes(
                    cityName: selectedValue,
                    stateName:
                        selectedState ??
                        'Unknown State', // Передаем выбранный штат
                    countryName:
                        selectedCountry ??
                        'Unknown Country', // Передаем выбранную страну
                  ),
            ),
          );
        }
      },
    );
  }
}
