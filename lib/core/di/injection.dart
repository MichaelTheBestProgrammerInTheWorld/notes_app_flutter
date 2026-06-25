import 'package:get_it/get_it.dart';
import 'package:notes_app_flutter/data/database/app_database.dart';

final getIt = GetIt.instance;

Future<void> setupInjection() async {
  // Database
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  // Repositories (To be added)
}
