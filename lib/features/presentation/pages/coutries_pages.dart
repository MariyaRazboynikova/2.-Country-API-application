// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/core/themes/theme_provider.dart';
// import 'package:flutter_application_2/core/themes/themes.dart';
// import 'package:flutter_application_2/features/domain/repository/country_repository.dart';
// import 'package:flutter_application_2/features/presentation/bloc/bloc_list/country_bloc.dart';
// import 'package:flutter_application_2/features/presentation/pages/country_detail_page.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../widgets/country_card.dart';

// class CountriesPage extends StatelessWidget {
//   const CountriesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themesProvider = context.watch<ThemesProvider>();
//     return BlocProvider(
//       create: (context) => CountryBloc(context.read<CountryRepository>()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Center(
//             child: Text(
//               'Countries',
//               style: TextStyle(color: Theme.of(context).colorScheme.primary),
//             ),
//           ),
//           actions: [
//             Switch(
//               activeColor: Theme.of(context).colorScheme.primary,
//               inactiveThumbColor: Theme.of(context).colorScheme.primary,
//               inactiveTrackColor: Theme.of(context).colorScheme.secondary,
//               thumbIcon: WidgetStateProperty.resolveWith<Icon?>((
//                 Set<WidgetState> states,
//               ) {
//                 if (states.contains(WidgetState.selected)) {
//                   return const Icon(Icons.sunny);
//                 }
//                 return const Icon(Icons.star);
//               }),
//               value: themesProvider.themeData == darkMode,
//               onChanged: (value) {
//                 themesProvider.toggleTheme();
//               },
//             ),
//           ],
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pushNamedAndRemoveUntil(
//                 context,
//                 '/intro_page',
//                 (route) => false,
//               );
//             },
//             icon: Icon(
//               Icons.arrow_back_ios_rounded,
//               color: Theme.of(context).colorScheme.primary,
//               size: 30,
//             ),
//           ),
//         ),

//         body: BlocBuilder<CountryBloc, CountryState>(
//           builder: (context, state) {
//             if (state is CountryLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is CountryError) {
//               return Center(child: Text('Error: ${state.messageError}'));
//             } else if (state is CountryLoadSuccess) {
//               return ListView.builder(
//                 itemCount: state.countries.length,
//                 itemBuilder: (context, index) {
//                   final country = state.countries[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder:
//                               (context) =>
//                                   CountryDetailPage(countryName: country.name),
//                         ),
//                       );
//                     },
//                     child: CountryCard(country: country),
//                   );
//                 },
//               );
//             }
//             return const Center(
//               child: Text('Please press the button to load countries'),
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             final bloc = context.read<CountryBloc>();
//             bloc.add(FetchCountries());
//           },
//           child: const Icon(Icons.refresh),
//         ),
//       ),
//     );
//   }
// }
