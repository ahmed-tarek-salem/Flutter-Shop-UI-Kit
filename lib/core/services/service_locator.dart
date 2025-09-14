import 'package:get_it/get_it.dart';
import 'package:stylish/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:stylish/features/home/data/repo/home_repo.dart';
import 'package:stylish/features/home/presentation/view_models/home_view_model.dart';

import '../services/network_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Core services (singletons)
  getIt.registerLazySingleton<NetworkService>(() => NetworkService());

  // Date sources (singletons)
  getIt.registerLazySingleton<HomeRemoteDataSourceInterface>(
    () => HomeRemoteDataSource(networkService: getIt()),
  );
  // Repositories
  getIt.registerLazySingleton<HomeRepoInterface>(
      () => HomeRepo(remoteDataSource: getIt()));

  // ViewModels (factory so every screen gets a new instance)
  getIt.registerFactory<HomeViewModel>(
      () => HomeViewModel(homeRepo: getIt<HomeRepoInterface>()));
}
