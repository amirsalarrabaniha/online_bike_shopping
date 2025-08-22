import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(SettingsState(
            locale: const Locale('en'), themeMode: ThemeMode.light)) {
    on<ChangeLocaleEvent>((event, emit) {
      emit(state.copyWith(locale: event.locale));
    });

    on<ToggleThemeEvent>((event, emit) {
      final newTheme =
          state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      emit(state.copyWith(themeMode: newTheme));
    });
  }
}
