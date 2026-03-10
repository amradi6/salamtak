import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salamtak/features/splash/domain/usecases/get_initial_route_usecase.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final GetInitialRouteUsecase _getInitialRouteUsecase;

  SplashCubit({required GetInitialRouteUsecase getInitialRoute})
    : _getInitialRouteUsecase = getInitialRoute,
      super(SplashInitial());

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    final route = _getInitialRouteUsecase();
    emit(SplashNavigate(route));
  }
}
