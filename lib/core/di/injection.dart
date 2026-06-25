import 'package:get_it/get_it.dart';
import 'package:notes_app_flutter/data/database/app_database.dart';
import 'package:notes_app_flutter/data/repositories/notes_repository_impl.dart';
import 'package:notes_app_flutter/domain/repositories/notes_repository.dart';

final getIt = GetIt.instance;

Future<void> setupInjection() async {
  // Database
  final db = AppDatabase();
  getIt.registerSingleton<AppDatabase>(db);

  // Repositories
  getIt.registerLazySingleton<NotesRepository>(() => NotesRepositoryImpl(db));
}
