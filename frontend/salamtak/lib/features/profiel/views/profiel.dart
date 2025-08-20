import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salamtak/features/auth/cubit/auth_cubit.dart';

class Profiel extends StatefulWidget {
  const Profiel({super.key});

  @override
  State<Profiel> createState() => _ProfielState();
}

class _ProfielState extends State<Profiel> with TickerProviderStateMixin {
  bool isPersonalExpanded = false;
  bool isFamilyExpanded = false;
  late AnimationController _personalController;
  late AnimationController _familyController;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'قص الصورة',
            toolbarColor: Colors.green,
            toolbarWidgetColor: Colors.white,
            hideBottomControls: true,
            // يخفي خيارات extra
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: false, // 🔑 هنا المستخدم يحدد بنفسه
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _imageFile = File(croppedFile.path);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _personalController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _familyController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _personalController.dispose();
    _familyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: size.height * 0.12249,
                bottom: size.height * 0.0262,
                left: size.width * 0.03889,
                right: size.width * 0.03889,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                  GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: size.width * 0.23334,
                    width: size.width * 0.23334,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 5,
                        color: Colors.black12,
                      ),
                    ),
                    child: ClipOval(
                      child: _imageFile != null ? Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                      )
                          : Icon(Icons.person, size: 50, color: Colors
                          .green,),
                    ),
                  ),
                  ),
                    SizedBox(height: size.height * 0.01749),
                    FutureBuilder(
                      future: context.read<AuthCubit>().displayName,
                      builder: (context, snapshot) {
                        return Text(
                          snapshot.data??"User",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Rubik",
                            color: Color(0XFF111827),
                          ),
                        );
                      },
                      // child: Text(
                      //   "AmrAdi",
                      //   style: TextStyle(
                      //     fontSize: 17,
                      //     fontWeight: FontWeight.w700,
                      //     fontFamily: "Rubik",
                      //     color: Color(0XFF111827),
                      //   ),
                      // ),
                    ),
                    SizedBox(height: size.height * 0.0076),
                    Text(
                      "sarah.anderson@email.com",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontSize: 11.9,
                        color: Color(0XFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: size.height * 0.0262,
                bottom: size.height * 0.04593,
                right: size.width * 0.07778,
                left: size.width * 0.07778,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Health Summary",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Inter",
                        fontSize: 15.3,
                        color: Color(0XFF111827),
                      ),
                    ),
                    SizedBox(height: size.height * 0.0174),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/blood.png",
                          height: size.height * 0.02187,
                          width: size.height * 0.02187,
                        ),
                        SizedBox(width: size.width * 0.02916),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Blood Type",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                fontSize: 11.9,
                                color: Color(0XFF6B7280),
                              ),
                            ),
                            SizedBox(height: size.height * 0.00328),
                            Text(
                              "A+",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                fontSize: 13.6,
                                color: Color(0XFF000000),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: size.width * 0.24307),
                        Image.asset(
                          "assets/images/weight.png",
                          height: size.height * 0.02187,
                          width: size.height * 0.02187,
                        ),
                        SizedBox(width: size.width * 0.02916),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Weight",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                fontSize: 11.9,
                                color: Color(0XFF6B7280),
                              ),
                            ),
                            SizedBox(height: size.height * 0.00328),
                            Text(
                              "65Kg",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                fontSize: 13.6,
                                color: Color(0XFF000000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.032811),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/height.png",
                          height: size.height * 0.02187,
                          width: size.height * 0.02187,
                        ),
                        SizedBox(width: size.width * 0.02916),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Height",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                fontSize: 11.9,
                                color: Color(0XFF6B7280),
                              ),
                            ),
                            SizedBox(height: size.height * 0.00328),
                            Text(
                              "165cm",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                fontSize: 13.6,
                                color: Color(0XFF000000),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: size.width * 0.28),
                        Image.asset(
                          "assets/images/allergies.png",
                          height: size.height * 0.02187,
                          width: size.height * 0.02187,
                        ),
                        SizedBox(width: size.width * 0.02916),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Allergies",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter",
                                fontSize: 11.9,
                                color: Color(0XFF6B7280),
                              ),
                            ),
                            SizedBox(height: size.height * 0.00328),
                            Text(
                              "2",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter",
                                fontSize: 13.6,
                                color: Color(0XFF000000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.0262),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.0777),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isPersonalExpanded = !isPersonalExpanded;
                        if (isPersonalExpanded) {
                          _personalController.forward();
                        } else {
                          _personalController.reverse();
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_document,
                          color: Color(0XFF0EBE7E),
                          size: 20,
                        ),
                        SizedBox(width: size.width * 0.0048),
                        Text(
                          "Personal Records",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15.3,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF111827),
                          ),
                        ),
                        Spacer(),
                        RotationTransition(
                          turns: Tween(
                            begin: 0.0,
                            end: 0.5,
                          ).animate(_personalController),
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xFF9CA3AF),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: ConstrainedBox(
                      constraints:
                          isPersonalExpanded
                              ? BoxConstraints()
                              : BoxConstraints(maxHeight: 0),
                      child: ClipRect(
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/images/AmrAdi.jpg",
                              height: size.width * 0.11667,
                              width: size.width * 0.11667,
                            ),
                          ),
                          title: Text(
                            "My Record",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF111827),
                              fontSize: 13.6,
                            ),
                          ),
                          subtitle: Text(
                            "Spouse",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF6B7280),
                              fontSize: 11.9,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0XFF9CA3AF),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.0349),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isFamilyExpanded = !isFamilyExpanded;
                        if (isFamilyExpanded) {
                          _familyController.forward();
                        } else {
                          _familyController.reverse();
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.family_restroom,
                          color: Color(0XFF0EBE7E),
                          size: 20,
                        ),
                        SizedBox(width: size.width * 0.0048),
                        Text(
                          "Family Records",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15.3,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF111827),
                          ),
                        ),
                        Spacer(),
                        RotationTransition(
                          turns: Tween(
                            begin: 0.0,
                            end: 0.5,
                          ).animate(_familyController),
                          child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xFF9CA3AF),
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: ConstrainedBox(
                      constraints:
                          isFamilyExpanded
                              ? BoxConstraints()
                              : BoxConstraints(maxHeight: 0),
                      child: ClipRect(
                        child: Column(
                          children: [
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/images/AmrAdi.jpg",
                                  height: size.width * 0.11667,
                                  width: size.width * 0.11667,
                                ),
                              ),
                              title: Text(
                                "My Record",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF111827),
                                  fontSize: 13.6,
                                ),
                              ),
                              subtitle: Text(
                                "Spouse",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF6B7280),
                                  fontSize: 11.9,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0XFF9CA3AF),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03499),
                            ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  "assets/images/AmrAdi.jpg",
                                  height: size.width * 0.11667,
                                  width: size.width * 0.11667,
                                ),
                              ),
                              title: Text(
                                "My Record",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF111827),
                                  fontSize: 13.6,
                                ),
                              ),
                              subtitle: Text(
                                "Spouse",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF6B7280),
                                  fontSize: 11.9,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0XFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.1093),
          ],
        ),
      ),
    );
  }
}
