part of 'settings_bloc.dart';

abstract class SettingsEvent {}

class ChangeLocaleEvent extends SettingsEvent {
  final Locale locale;

  ChangeLocaleEvent(this.locale);
}

class ToggleThemeEvent extends SettingsEvent {}
