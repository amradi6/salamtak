import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/core/constants/utils/nav_icon.dart';
import 'package:salamtak/features/home/cubit/home__cubit.dart';
import 'package:salamtak/features/home/cubit/home__state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.watch<HomeCubit>();
        return Scaffold(
          extendBody: true,
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: size.height * 0.091,
              decoration: BoxDecoration(
                color: Color(0XFFFFFFFF),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 180,
                    color: Color(0X19000000),
                  ),
                ],
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navIcon(
                    icon: Icons.home,
                    index: 0,
                    currentIndex: context.read<HomeCubit>().currentIndex,
                    onTap: () => context.read<HomeCubit>().changeTab(0),
                  ),
                  navIcon(
                    icon: Icons.favorite,
                    index: 1,
                    currentIndex: context.read<HomeCubit>().currentIndex,
                    onTap: () => context.read<HomeCubit>().changeTab(1),
                  ),
                  navIcon(
                    icon: Icons.book_online,
                    index: 2,
                    currentIndex: context.read<HomeCubit>().currentIndex,
                    onTap: () => context.read<HomeCubit>().changeTab(2),
                  ),
                  navIcon(
                    icon: Icons.person,
                    index: 3,
                    currentIndex: context.read<HomeCubit>().currentIndex,
                    onTap: () => context.read<HomeCubit>().changeTab(3),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
