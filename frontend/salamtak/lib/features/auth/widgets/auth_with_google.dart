import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';
import 'package:salamtak/features/auth/cubit/auth_state.dart';

class AuthWithGoogle extends StatelessWidget {
  const AuthWithGoogle({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          width: size.width * 0.41666,
          height: size.height * 0.06705575,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Color(0X06000000), blurRadius: 22)],
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFFFFFFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/google.png",
                    width: size.width * 0.0473177,
                    height: size.height * 0.022563,
                  ),
                  SizedBox(width: size.width * 0.0333),
                  Text(
                    "Google",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      fontFamily: "Rubik",
                      color: Color(0XFF677294),
                    ),
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
