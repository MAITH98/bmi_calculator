import 'package:flutter/material.dart';

class BMIAdvice extends StatelessWidget {
  final String bmiCategory;
  final TextStyle sectionHeaderStyle;
  final TextStyle bodyTextStyle;

  BMIAdvice({
    required this.bmiCategory,
    required this.sectionHeaderStyle,
    required this.bodyTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Diet and Nutrition",
          style: sectionHeaderStyle,
        ),
        const SizedBox(height: 5),
        Text(
          _getDietAdvice(),
          style: bodyTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          _getDietDetails(),
          style: bodyTextStyle,
        ),
        const SizedBox(height: 10), // Adds space between sections
        Text(
          "Exercise",
          style: sectionHeaderStyle,
        ),
        const SizedBox(height: 5),
        Text(
          _getExerciseAdvice(),
          style: bodyTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          _getExerciseDetails(),
          style: bodyTextStyle,
        ),
        const SizedBox(height: 10), // Adds space between sections
        Text(
          "Lifestyle Tips",
          style: sectionHeaderStyle,
        ),
        const SizedBox(height: 5),
        Text(
          _getLifestyleTips(),
          style: bodyTextStyle,
        ),
        const SizedBox(height: 10),
        Text(
          "Mental Health",
          style: sectionHeaderStyle,
        ),
        const SizedBox(height: 5),
        Text(
          _getMentalHealthAdvice(),
          style: bodyTextStyle,
        ),
      ],
    );
  }

  String _getDietAdvice() {
    if (bmiCategory == 'Underweight') {
      return "Increase Caloric Intake:";
    } else if (bmiCategory == 'Normal weight') {
      return "Maintain a Balanced Diet:";
    } else if (bmiCategory == 'Overweight' || bmiCategory == 'Obesity') {
      return "Adopt a Calorie-Deficit Diet:";
    } else {
      return "Unknown Diet Advice";
    }
  }

  String _getDietDetails() {
    if (bmiCategory == 'Underweight') {
      return "• Focus on nutrient-dense foods such as nuts, seeds, and healthy oils.\n"
          "• Incorporate more frequent meals and snacks.";
    } else if (bmiCategory == 'Normal weight') {
      return "• Consume a variety of nutrient-rich foods such as fruits, vegetables, lean proteins, and whole grains.\n"
          "• Avoid excess sugars and processed foods; opt for healthier alternatives.";
    } else if (bmiCategory == 'Overweight' || bmiCategory == 'Obesity') {
      return "• Reduce portion sizes and focus on lower-calorie foods.\n"
          "• Avoid sugary drinks and minimize processed foods.";
    } else {
      return "Unknown Diet Details";
    }
  }

  String _getExerciseAdvice() {
    return "Consistent Exercise Routine:";
  }

  String _getExerciseDetails() {
    if (bmiCategory == 'Underweight') {
      return "• Incorporate strength training to build muscle mass.\n"
          "• Avoid excessive cardio that could lead to more weight loss.";
    } else if (bmiCategory == 'Normal weight') {
      return "• Aim for 150 minutes of moderate-intensity cardio weekly (brisk walking, swimming, cycling).\n"
          "• Include strength training exercises 2-3 times per week to maintain muscle tone.";
    } else if (bmiCategory == 'Overweight' || bmiCategory == 'Obesity') {
      return "• Focus on low-impact cardio exercises like swimming or walking.\n"
          "• Add resistance training to improve muscle mass.";
    } else {
      return "Unknown Exercise Details";
    }
  }

  String _getLifestyleTips() {
    return "• Stay hydrated by drinking enough water (8-10 glasses per day).\n"
        "• Get regular health check-ups to monitor blood pressure, cholesterol, and other markers of health.";
  }

  String _getMentalHealthAdvice() {
    return "• Practice stress management techniques like yoga, meditation, or deep breathing.\n"
        "• Prioritize hobbies and social interactions that make you feel fulfilled and happy.";
  }
}
