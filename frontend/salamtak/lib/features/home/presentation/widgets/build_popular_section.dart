import 'package:flutter/material.dart';
import 'package:salamtak/features/home/presentation/widgets/container_for_popular_doctor.dart';
import 'package:salamtak/core/constants/widgets/doctor_shimmer.dart';

import '../cubit/home_cubit.dart';

Widget buildPopularSection(
    BuildContext context, Size size, HomeState state, List popular) {
  if (state is PopularDoctorsLoading) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (_, __) => DoctorShimmer(
        size: size,
        height: size.height * 0.327828138,
        width: size.width * 0.4947916,
      ),
    );
  }

  if (popular.isNotEmpty) {
    final count = popular.length > 5 ? 5 : popular.length;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: count,
      itemBuilder: (context, index) {
        final doctor = popular[index];
        return ContainerForPopularDoctor(
          onTap: () => Navigator.of(context)
              .pushNamed('/doctor_details', arguments: doctor),
          size: size,
          image: doctor.imageUrl,
          nameDoctor: doctor.name,
          doctorSpecialty: doctor.specialty,
          rating: doctor.rating,
        );
      },
    );
  }

  if (state is PopularDoctorsError) {
    debugPrint(state.message);
    return Center(child: Text('Error: ${state.message}'));
  }

  return const Center(child: Text('No Data'));
}