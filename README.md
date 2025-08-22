# Flutter News Clean + Bloc

A Flutter News application built using **Clean Architecture**, **Bloc** for state management, and *
*Localization** support (English & Persian). This project demonstrates a modular structure with *
*theme switching**, network calls via **Dio**, and simple **navigation**.

## Features

* **Clean Architecture** for scalable and maintainable code
* News listing and news detail page
* Search functionality
* Light and dark theme support
* English (`en`) and Persian (`fa`) localization
* Error handling and loading indicators
* State management with **Bloc**
* Modular project structure

## Project Structure

```
lib/
│
├─ core/
│   ├─ constants/        # App constants
│   ├─ error/            # Failures, exceptions
│   ├─ theme/            # App theme files (light/dark)
│   └─ usecase/          # Base usecase class
│
├─ features/news/
│   ├─ data/
│   │   ├─ datasources/     # Remote / Local data sources
│   │   ├─ models/          # Models and JSON parsing
│   │   └─ repositories/    # Repository implementations
│   │
│   ├─ domain/
│   │   ├─ entities/        # Entity classes
│   │   ├─ repositories/    # Repository contracts
│   │   └─ usecases/        # UseCase classes
│   │
│   └─ presentation/
│       ├─ bloc/            # Bloc, Event, State
│       ├─ pages/           # UI pages (NewsListPage, NewsDetailPage)
│       └─ widgets/         # Reusable widgets
│
└─ main.dart
```

## Getting Started

### Prerequisites

* Flutter SDK >= 3.6.2
* Dart >= 3.6.2

### Installation

1. Clone the repository:

```bash
git clone https://github.com/amirsalarrabaniha/flutter_news_clean_bloc.git
cd flutter_news_clean
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

## Bloc & State Management

* **Bloc** handles all state management for the app.
* **NewsBloc** → manages news list and search events
* **NewsDetailBloc** → manages news detail data
* **SettingsBloc** → handles theme and localization

Use Bloc in widgets:

```dart
BlocBuilder<NewsBloc, NewsState>
(
builder: (context, state) {
if (state is NewsLoading) return CircularProgressIndicator();
if (state is NewsLoaded) return ListView(...);
if (state is NewsError) return Text(state.message);
return Container();
},
)
```

## Localization

Localization is handled via ARB files located in:

```
lib/core/localization/l10n/
```

* `app_en.arb` → English
* `app_fa.arb` → Persian

Generated localization file:

```
lib/core/localization/app_localizations.dart
```

Use localization in widgets:

```dart
Text(context.l10n.newsTitle)
```

## Theme

Themes are defined in `core/theme/app_theme.dart`.
Switch between **light** and **dark** modes via `SettingsBloc`.

## Dependencies

* `flutter_bloc` → State management
* `equatable` → Simplify model equality
* `dio` → Networking
* `intl` → Localization
* `flutter_localizations` → Built-in Flutter localization support

## Contributing

1. Fork the project
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m "Add some feature"`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a Pull Request

## License

This project is **MIT Licensed**
