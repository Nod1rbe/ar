import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ar/core/cubit/settings_cubit.dart';
import 'package:ar/features/subjects/data/datasources/subject_local_data_source.dart';
import 'package:ar/features/subjects/data/repositories/subject_repository_impl.dart';
import 'package:ar/features/subjects/domain/repositories/subject_repository.dart';
import 'package:ar/features/subjects/domain/usecases/get_subjects.dart';
import 'package:ar/features/subjects/presentation/cubit/subject_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Cubit
  sl.registerFactory(() => SubjectCubit(getSubjects: sl()));
  sl.registerFactory(() => SettingsCubit(sharedPreferences: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetSubjects(sl()));

  // Repository
  sl.registerLazySingleton<SubjectRepository>(
    () => SubjectRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<SubjectLocalDataSource>(
    () => SubjectLocalDataSourceImpl(),
  );
}
