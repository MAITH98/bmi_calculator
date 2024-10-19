class BMIModel {
  final double height; // in cm
  final double weight; // in kg
  final int age; // age in years
  final String gender; // 'Male' or 'Female'

  BMIModel({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  // Calculate BMI based on weight and height
  double calculateBMI() {
    final heightInMeters = height / 100; // Convert height to meters
    double bmi = weight / (heightInMeters * heightInMeters);
    print(bmi);
    return bmi;
  }

  // Return standardized BMI category
  String getBMICategory() {
    final bmi = calculateBMI(); // Calculate BMI once

    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  // Get more detailed advice based on age and gender
  String getDetailedBMICategory() {
    final bmi = calculateBMI();
    if (bmi < 18.5) {
      return _getUnderweightCategory(bmi);
    } else if (bmi < 24.9) {
      return _getNormalWeightCategory(bmi);
    } else if (bmi < 29.9) {
      return _getOverweightCategory(bmi);
    } else {
      return _getObesityCategory(bmi);
    }
  }

  String _getUnderweightCategory(double bmi) {
    if (age < 18) {
      return 'Underweight (Teen/Child)';
    } else if (age >= 65) {
      return 'Underweight (Elderly)';
    } else {
      return 'Underweight';
    }
  }

  String _getNormalWeightCategory(double bmi) {
    if (gender == 'Male' && bmiInHealthyRange(bmi)) {
      return 'Normal weight (Ideal for Men)';
    } else if (gender == 'Female' && bmiInHealthyRange(bmi)) {
      return 'Normal weight (Ideal for Women)';
    }
    return 'Normal weight';
  }

  String _getOverweightCategory(double bmi) {
    if (age < 18) {
      return 'Overweight (Teen/Child)';
    } else if (age >= 65) {
      return 'Overweight (Elderly)';
    } else if (gender == 'Male') {
      return 'Overweight (Men)';
    } else {
      return 'Overweight (Women)';
    }
  }

  String _getObesityCategory(double bmi) {
    if (bmi >= 40) {
      return 'Obesity (Class 3)';
    } else if (bmi >= 35) {
      return 'Obesity (Class 2)';
    } else {
      return 'Obesity (Class 1)';
    }
  }

  // Check if BMI falls into the healthy range
  bool bmiInHealthyRange(double bmi) {
    return bmi >= 18.5 && bmi < 24.9;
  }
}
