import 'package:salamtak/features/splash/domain/repositories/splash_repository.dart';

class GetInitialRouteUsecase {
  final SplashRepository _splashRepository ;

  GetInitialRouteUsecase(this._splashRepository);

  String call(){
    if(_splashRepository.isLoggedIn) return '/layout';
    if (_splashRepository.hasSeenOnboarding) return '/login';
    return '/onboarding1';
  }
}