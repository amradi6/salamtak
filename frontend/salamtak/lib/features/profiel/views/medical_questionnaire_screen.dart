import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:salamtak/features/profiel/widgets/section_tile.dart';

class MedicalQuestionnaireScreen extends StatefulWidget {
  const MedicalQuestionnaireScreen({super.key});

  @override
  State<MedicalQuestionnaireScreen> createState() =>
      _MedicalQuestionnaireScreenState();
}

class _MedicalQuestionnaireScreenState
    extends State<MedicalQuestionnaireScreen> {
  int currentStep = 0;
  List<bool> completedSteps = [false, false, false, false];
  List<bool> expandedSections = [true, false, false, false];
  final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  String? selectedBloodType;
  final GlobalKey<FormState> _formKeyForBasicInformation = GlobalKey<FormState>();
  File? _imageForLabResults;
  File? _imageForCardiology;
  File? _imageForNeurology;

  Future<void> _pickImageForLabResults() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageForLabResults = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageForCardiology() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageForCardiology = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageForNeurology() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageForNeurology = File(pickedFile.path);
      });
    }
  }

  String? validate(value) {
    if (value == null || (value is String && value.isEmpty)) {
      return "This field must not be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Color(0XFF10B981),
            height: size.height * 0.16187,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.03171),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: size.width * 0.019445),
                      Text(
                        "Medical Questionnaire",
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Color(0XFFFFFFFF),
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.00874),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(4, (index) {
                      bool isCompleted = completedSteps[index];
                      bool isActive = currentStep == index;
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor:
                                isCompleted
                                    ? Color(0XFF34D399)
                                    : (isActive
                                        ? Colors.white
                                        : Color(0XFF34D399)),
                            child:
                                isCompleted
                                    ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    )
                                    : Text(
                                      "${index + 1}",
                                      style: TextStyle(
                                        color:
                                            isActive
                                                ? Color(0XFF10B981)
                                                : Color(0XFFFFFFFF),
                                      ),
                                    ),
                          ),
                          SizedBox(height: size.height * 0.0087),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.73280,
            child: ListView(
              children: [
                Form(
                  key: _formKeyForBasicInformation,
                  child: SectionTile(
                    index: 0,
                    title: "Basic Information",
                    content: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Height (cm)",
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Color(0XFF374151),
                                fontSize: 11.9,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: size.height * 0.00437),
                            TextFormField(
                              validator: (value) => validate(value),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Enter height",
                                hintStyle: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0XFFCCCCCC),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0XFFD1D5DB),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0XFFD1D5DB),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02624),

                            Text(
                              "Weight (kg)",
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Color(0XFF374151),
                                fontSize: 11.9,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: size.height * 0.00437),
                            TextFormField(
                              validator: (value) => validate(value),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Enter Weight",
                                hintStyle: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0XFFCCCCCC),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0XFFD1D5DB),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0XFFD1D5DB),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02624),

                            Text(
                              "Blood Type",
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Color(0XFF374151),
                                fontSize: 11.9,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: size.height * 0.00437),
                            DropdownButtonFormField(
                              validator: (value) => validate(value),
                              decoration: InputDecoration(
                                hintText: "Enter Weight",
                                hintStyle: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0XFFCCCCCC),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0XFFD1D5DB),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0XFFD1D5DB),
                                    width: 1,
                                  ),
                                ),
                              ),
                              hint: Text(
                                "Select blood type",
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              value: selectedBloodType,
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(8),
                              items:
                                  bloodTypes.map((blood) {
                                    return DropdownMenuItem(
                                      value: blood,
                                      child: Text(blood),
                                    );
                                  }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedBloodType = value;
                                });
                              },
                            ),
                            SizedBox(height: size.height * 0.02624),

                            Text(
                              "Allergies",
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Color(0XFF374151),
                                fontSize: 11.9,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: size.height * 0.00437),
                            TextFormField(
                              validator: (value) => validate(value),
                              keyboardType: TextInputType.number,
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: "Select blood type",
                                hintStyle: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0XFFCCCCCC),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0XFFD1D5DB),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0XFFD1D5DB),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02624),
                          ],
                        ),
                      ],
                    ),
                    isExpanded: expandedSections[0],
                    onExpansionChanged: (expanded) {
                      setState(() {
                        expandedSections[0] = expanded;
                        if (expanded) currentStep = 0;
                      });
                    },
                  ),
                ),

                SectionTile(
                  index: 1,
                  title: "Lab Results",
                  content: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.0583),
                          child: Text(
                            "Upload Lab Result Photos",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0XFF374151),
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              fontSize: 11.9,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.0109),
                        Center(
                          child: GestureDetector(
                            onTap: _pickImageForLabResults,
                            child: Container(
                              width: size.width * 0.64171,
                              height: size.height * 0.1618,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0XFFD1D5DB),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              child:
                                  _imageForLabResults == null
                                      ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.0262,
                                          ),
                                          Icon(
                                            Icons.add_photo_alternate,
                                            size: size.height * 0.05249,
                                            color: Color(0XFF9CA3AF),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.0262,
                                          ),
                                          Text(
                                            "Click to upload or drag and drop \n PNG, JPG up to 10MB",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0XFF6B7280),
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10.2,
                                            ),
                                          ),
                                        ],
                                      )
                                      : Image.file(_imageForLabResults!, fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  isExpanded: expandedSections[1],
                  onExpansionChanged: (expanded) {
                    setState(() {
                      expandedSections[1] = expanded;
                      if (expanded) currentStep = 1;
                    });
                  },
                ),

                SectionTile(
                  index: 2,
                  title: "Cardiology",
                  content: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Previous Conditions",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          TextFormField(
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: "List previous conditions",
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFFCCCCCC),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),

                          Text(
                            "Current Conditions",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          TextFormField(
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: "List current conditions",
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFFCCCCCC),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),

                          Text(
                            "Current Medications",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          TextFormField(
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: "List current medications",
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFFCCCCCC),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),


                          Text(
                            "Upload X-ray Image",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          Center(
                            child: GestureDetector(
                              onTap: _pickImageForCardiology,
                              child: Container(
                                width: size.width * 0.64171,
                                height: size.height * 0.1618,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0XFFD1D5DB),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child:
                                _imageForCardiology == null
                                    ? Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.0262,
                                    ),
                                    Icon(
                                      Icons.add_photo_alternate,
                                      size: size.height * 0.05249,
                                      color: Color(0XFF9CA3AF),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.0262,
                                    ),
                                    Text(
                                      "Click to upload or drag and drop \n PNG, JPG up to 10MB",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0XFF6B7280),
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.2,
                                      ),
                                    ),
                                  ],
                                )
                                    : Image.file(
                                    _imageForCardiology!, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),

                          Text(
                            "Previous Doctor",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          TextFormField(
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Enter previous doctor's name",
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFFCCCCCC),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),

                          Text(
                            "Current Doctor",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          TextFormField(
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Enter current doctor's name",
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFFCCCCCC),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),
                        ],
                      ),
                    ],
                  ),
                  isExpanded: expandedSections[2],
                  onExpansionChanged: (expanded) {
                    setState(() {
                      expandedSections[2] = expanded;
                      if (expanded) currentStep = 2;
                    });
                  },
                ),

                SectionTile(
                  index: 3,
                  title: "Neurology",
                  content: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Previous Conditions",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          TextFormField(
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: "List previous conditions",
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFFCCCCCC),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),

                          Text(
                            "Current Conditions",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          TextFormField(
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: "List current conditions",
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFFCCCCCC),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),

                          Text(
                            "Current Medications",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          TextFormField(
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text,
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: "List current medications",
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFFCCCCCC),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),


                          Text(
                            "Upload X-ray Image",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          Center(
                            child: GestureDetector(
                              onTap: _pickImageForNeurology,
                              child: Container(
                                width: size.width * 0.64171,
                                height: size.height * 0.1618,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0XFFD1D5DB),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child:
                                _imageForNeurology == null
                                    ? Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.0262,
                                    ),
                                    Icon(
                                      Icons.add_photo_alternate,
                                      size: size.height * 0.05249,
                                      color: Color(0XFF9CA3AF),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.0262,
                                    ),
                                    Text(
                                      "Click to upload or drag and drop \n PNG, JPG up to 10MB",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0XFF6B7280),
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10.2,
                                      ),
                                    ),
                                  ],
                                )
                                    : Image.file(
                                    _imageForNeurology!, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),

                          Text(
                            "Previous Doctor",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          TextFormField(
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Enter previous doctor's name",
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFFCCCCCC),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),

                          Text(
                            "Current Doctor",
                            style: TextStyle(
                              fontFamily: "Inter",
                              color: Color(0XFF374151),
                              fontSize: 11.9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: size.height * 0.00437),
                          TextFormField(
                            validator: (value) => validate(value),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Enter current doctor's name",
                              hintStyle: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFFCCCCCC),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0XFFD1D5DB),
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02624),
                        ],
                      ),
                    ],
                  ),
                  isExpanded: expandedSections[3],
                  onExpansionChanged: (expanded) {
                    setState(() {
                      expandedSections[3] = expanded;
                      if (expanded) currentStep = 3;
                    });
                  },
                ),
              ],
            ),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(size.width * 0.7583, size.height * 0.06124),
              backgroundColor: Color(0XFF10B981),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              if (_formKeyForBasicInformation.currentState!.validate()) {
                setState(() {
                  completedSteps[currentStep] = true;
                  if (currentStep < 3) {
                    currentStep++;
                    expandedSections = List.generate(
                      4,
                      (i) => i == currentStep,
                    );
                  }
                });
              }
            },
            child: Text(
              "Save Questionnaire",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 13.6,
                fontWeight: FontWeight.w500,
                color: Color(0XFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
