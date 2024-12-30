# Country State City Flutter Application

### Overview

The **Country State City** application is a Flutter-based mobile app that allows users to explore countries, their states, and cities. The app utilizes a clean architecture with a focus on state management using the BLoC (Business Logic Component) pattern, providing a responsive and dynamic user experience.

### Features

- **Dynamic Theme Switching**: Users can toggle between light and dark themes seamlessly.
- **Country, State, and City Selection**: Users can select a country, view its states, and then select a city to view detailed information.
- **API Integration**: The app fetches data from the REST Countries API to provide real-time information about countries, states, and cities.

### Architecture
The application is structured using Clean Architecture principles and includes the following key components:

- **Presentation Layer**: Contains UI components such as `IntroPage`, `CountryPage`, and `CityDetailPage`.
- **Domain Layer**: Defines entities such as `CountryEntity`, `StateEntity`, and `CityEntity`, along with the repository interface.
- **Data Layer**: Implements data fetching using the `CountryStateCityApi` class, which interacts with the REST API.

### Themes
The app uses ThemeData to define light and dark themes.

### State Management
The application uses the BLoC pattern for managing state. The `CountryBloc` handles events such as loading countries and selecting states or cities. It communicates with the repository to fetch data and updates the UI accordingly.

### API Endpoints
The application interacts with the following API endpoints:

- **Get Countries and States**:
  
```plaintext
GET https://countriesnow.space/api/v0.1/countries/states
```

- **Get Cities by Country and State**:

```plaintext
GET https://countriesnow.space/api/v0.1/countries/state/cities/q?country={country}&state={state}
```