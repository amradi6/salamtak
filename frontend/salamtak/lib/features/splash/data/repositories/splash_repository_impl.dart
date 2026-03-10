import 'package:salamtak/features/splash/data/datasources/splash_local_datasource.dart';
import 'package:salamtak/features/splash/domain/repositories/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository{
  final SplashLocalDatasource _localDatasource;

  SplashRepositoryImpl(this._localDatasource);

  @override
  bool get hasSeenOnboarding => _localDatasource.hasSeenOnboarding;

  @override
  bool get isLoggedIn => _localDatasource.isLoggedIn;
}