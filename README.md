# Flutter News Clean + Riverpod

A Flutter News application built using **Clean Architecture**, **Riverpod** for state management, and **Localization** support (English & Persian). This project demonstrates a clean structure with **theme switching**, network calls via **Dio**, and reactive **UI**.

## Features

* Clean Architecture for scalable code
* News listing and news detail page
* Search functionality
* Light and dark theme support
* English (`en`) and Persian (`fa`) localization
* Error handling and loading indicators
* State management with Riverpod (`StateNotifierProvider`)
* Modular project structure with DI

## Project Structure

```
lib/
│
├─ core/
│   ├─ constants/        # App constants (API keys, urls)
│   ├─ di/               # Dependency Injection setup (Riverpod Providers)
│   ├─ error/            # Failures, exceptions
│   ├─ theme/            # App theme (light/dark)
│   └─ usecase/          # Base UseCase class
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
│       ├─ providers/       # Riverpod StateNotifierProviders
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
git clone https://github.com/amirsalarrabaniha/flutter_news_clean_riverpod.git
cd flutter_news_clean_riverpod
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
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

Use localization in widgets like:

```dart
Text(context.l10n.newsTitle)
```

## Theme

Themes are defined in `core/theme/app_theme.dart`.
You can switch between **light** and **dark** themes via `SettingsNotifier`:

```dart
ref.read(settingsProvider.notifier).toggleTheme();
```

## State Management

* **Riverpod** is used for managing state.
* Each feature has its own **StateNotifier**:

    * `NewsNotifier` → manages news list and search
    * `DetailNewsNotifier` → manages selected news for detail page
    * `SettingsNotifier` → manages locale and theme

## DI (Dependency Injection)

All dependencies are injected via **Riverpod Providers** in `core/di/`:

* RemoteDataSource → Repository → UseCase → StateNotifier

Example:

```dart
final newsNotifierProvider =
    StateNotifierProvider<NewsNotifier, NewsState>((ref) {
  final getNewsUseCase = ref.watch(getNewsUseCaseProvider);
  return NewsNotifier(getNewsUseCase);
});
```

## Dependencies

* `flutter_riverpod` → State management
* `dio` → Networking
* `intl` → Localization
* `flutter_localizations` → Built-in Flutter localization support
* `equatable` → Simplify model equality
* `freezed` + `json_serializable` → Immutable models

## Contributing

1. Fork the project
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m "Add some feature"`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a Pull Request

## License

This project is **MIT Licensed**.
