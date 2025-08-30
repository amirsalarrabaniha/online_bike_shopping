// lib/core/di/di.dart
import 'package:dio/dio.dart';
import 'package:online_bike_shopping/settings/settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Dio
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

// Provider to store an integer
final counterProvider = StateProvider<int>((ref) => 0);

// Settings StateNotifier provider
final settingsProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});
