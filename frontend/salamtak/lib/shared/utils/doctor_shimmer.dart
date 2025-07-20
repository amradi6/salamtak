import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularDoctorShimmer extends StatelessWidget {
  const PopularDoctorShimmer({
    super.key,
    required this.size,
    required this.width,
    required this.height,
  });

  final Size size;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: size.height*0.020),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 5)],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding:  EdgeInsets.all(size.height*0.012),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
              ),
              SizedBox(height: size.height*0.0099),
              Container(
                width: size.width * 0.4,
                height: 12,
                color: Colors.grey,
              ),
              SizedBox(height: size.height*0.0074),
              Container(
                width: size.width * 0.3,
                height: 10,
                color: Colors.grey,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
