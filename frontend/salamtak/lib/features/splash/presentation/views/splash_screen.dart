import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/di/injection_container.dart';
import 'package:salamtak/features/splash/presentation/cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SplashCubit>()..init(),
      child: const _SplashView(),
    );
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashNavigate) {
          Navigator.of(context).pushReplacementNamed(state.route);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Stack(
          children: [
            Positioned(
              top: size.height * -0.1242,
              left: size.width * -0.0859,
              child: Container(
                width: size.width * 0.5625,
                height: size.width * 0.5625,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Color(0x8461CEFF), Colors.transparent],
                    radius: 0.8,
                  ),
                ),
              ),
            ),

            Positioned(
              top: size.height * 0.8057,
              left: size.width * 0.5260,
              child: Container(
                width: size.width * 0.5625,
                height: size.width * 0.5625,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Color(0x480EBE7E), Colors.transparent],
                    radius: 0.8,
                  ),
                ),
              ),
            ),

            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/logo.png', width: 70),
                  const SizedBox(height: 16),
                  const Text(
                    'Salamtak',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF222222),
                      fontFamily: 'Rubik',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
