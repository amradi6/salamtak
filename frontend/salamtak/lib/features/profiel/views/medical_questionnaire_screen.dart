import 'package:flutter/material.dart';

class MedicalQuestionnaireScreen extends StatefulWidget {
  const MedicalQuestionnaireScreen({super.key});

  @override
  State<MedicalQuestionnaireScreen> createState() => _MedicalQuestionnaireScreenState();
}

class _MedicalQuestionnaireScreenState extends State<MedicalQuestionnaireScreen> {
  int currentStep = 0;
  List<bool> completedSteps = [false, false, false, false];
  List<bool> expandedSections = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Medical Questionnaire")),
      body: Column(
        children: [
          // ---- شريط الترقيم العلوي ----
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                bool isCompleted = completedSteps[index];
                bool isActive = currentStep == index;

                return Column(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: isCompleted
                          ? Colors.green
                          : (isActive ? Colors.green : Colors.grey[400]),
                      child: isCompleted
                          ? Icon(Icons.check, color: Colors.white, size: 20)
                          : Text("${index + 1}",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              }),
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                // القسم الأول
                buildSection(
                  index: 0,
                  title: "Basic Information",
                  content: Column(
                    children: [
                      TextField(decoration: InputDecoration(labelText: "Height (cm)")),
                      TextField(decoration: InputDecoration(labelText: "Weight (kg)")),
                      TextField(decoration: InputDecoration(labelText: "Blood Type")),
                    ],
                  ),
                ),

                buildSection(
                  index: 1,
                  title: "Lab Results",
                  content: Center(child: Text("Upload Lab Results Here")),
                ),

                buildSection(
                  index: 2,
                  title: "Cardiology",
                  content: Center(child: Text("Cardiology Questions")),
                ),

                buildSection(
                  index: 3,
                  title: "Neurology",
                  content: Center(child: Text("Neurology Questions")),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  completedSteps[currentStep] = true;
                  if (currentStep < 3) {
                    currentStep++;
                    expandedSections = List.generate(4, (i) => i == currentStep);
                  }
                });
              },
              child: Text("Save Questionnaire"),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSection({required int index, required String title, required Widget content}) {
    bool isExpanded = expandedSections[index];
    return Card(
      child: ExpansionTile(
        initiallyExpanded: isExpanded,
        onExpansionChanged: (expanded) {
          setState(() {
            expandedSections[index] = expanded;
            if (expanded) currentStep = index;
          });
        },
        leading: Icon(
          Icons.circle,
          color: isExpanded ? Colors.green : Colors.grey,
          size: 14,
        ),
        title: Text(title),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: content,
          )
        ],
      ),
    );
  }
}
