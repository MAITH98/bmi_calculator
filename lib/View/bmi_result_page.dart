import 'package:bmi/View/home_page.dart';
import 'package:bmi/Widgets/bmi_advice.dart';
import 'package:bmi/Widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIResult extends StatefulWidget {
  const BMIResult({
    super.key,
    required this.bmi,
    required this.bmiCategory,
    required this.toggleTheme,
    required this.isDark,
  });

  final double bmi;
  final String bmiCategory;
  final VoidCallback toggleTheme;
  final bool isDark;

  @override
  _BMIResultState createState() => _BMIResultState();
}

class _BMIResultState extends State<BMIResult> {
  @override
  Widget build(BuildContext context) {
    // Retrieve theme colors and text styles
    final Color primaryColor = Theme.of(context).primaryColor;
    final TextStyle titleStyle = Theme.of(context).textTheme.headlineLarge!;
    final TextStyle sectionHeaderStyle =
        Theme.of(context).textTheme.headlineMedium!;
    final TextStyle bodyTextStyle = Theme.of(context).textTheme.bodyLarge!;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor, // Use theme's primary color
          elevation: 10, // Adds shadow beneath the AppBar
          shadowColor:
              Colors.black54, // Shadow color, you can adjust its opacity
          titleSpacing: 0, // Adjusts spacing to align with leading icon
          title: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10.0), // Space above and beneath the title
            child: Text(
              'BMI Result',
              style: titleStyle.copyWith(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                widget.isDark ? Icons.wb_sunny : Icons.nights_stay,
                color: Colors.white,
              ),
              onPressed: widget.toggleTheme, // Toggle theme on button press
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0), // Space above and beneath the icon
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Icon(
                Icons.hourglass_full,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Simple Gauge Replacement
              SizedBox(
                height: 300,
                width: 300,
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    // Check if the current theme is dark or light
                    bool isDarkTheme =
                        Theme.of(context).brightness == Brightness.dark;

                    return SweepGradient(
                      startAngle: 0.0,
                      endAngle: 3.14 * 2,
                      colors: isDarkTheme
                          ? <Color>[
                              Colors.red[
                                  400]!, // Lighter dark red for dark theme (Obesity Class 3)
                              Colors.blue[
                                  200]!, // Lighter blue for dark theme (Underweight)
                              Colors.green[
                                  200]!, // Lighter green for dark theme (Normal weight)
                              Colors.yellow[
                                  200]!, // Lighter yellow for dark theme (Overweight)
                              Colors.orange[
                                  200]!, // Lighter orange for dark theme (Obesity Class 1)
                              Colors.red[
                                  200]!, // Lighter red for dark theme (Obesity Class 2)
                            ]
                          : <Color>[
                              Colors.red[
                                  900]!, // Darkest red for light theme (Obesity Class 3)
                              Colors
                                  .blue, // Darker blue for light theme (Underweight)
                              Colors
                                  .green, // Darker green for light theme (Normal weight)
                              Colors
                                  .yellow, // Darker yellow for light theme (Overweight)
                              Colors
                                  .orange, // Darker orange for light theme (Obesity Class 1)
                              Colors
                                  .red, // Darker red for light theme (Obesity Class 2)
                            ],
                      stops: const <double>[
                        0.0, // Starting point for blue (Underweight)
                        0.37, // End point for green (Normal weight)
                        0.60, // End point for yellow (Overweight)
                        0.75, // End point for orange (Obesity Class 1)
                        0.90, // End point for red (Obesity Class 2)
                        1.0, // End point for darkest red (Obesity Class 3)
                      ],
                    ).createShader(bounds);
                  },
                  child: SfRadialGauge(
                    title: const GaugeTitle(
                      text: 'Your BMI Score',
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 50, // Max BMI for the range
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 50,
                            color: Colors
                                .transparent, // Set this to transparent to let gradient show
                            startWidth: 10,
                            endWidth: 10,
                          ),
                        ],
                        pointers: <GaugePointer>[
                          NeedlePointer(value: widget.bmi),
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Text(
                              '${widget.bmi.toInt()}',
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            angle: 90,
                            positionFactor: 0.5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Text(
                    widget.bmiCategory,
                    style:
                        sectionHeaderStyle, // Customize this with the right style
                  ),
                ],
              ),
              CustomCard(
                clicked: false,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: BMIAdvice(
                    bmiCategory: widget.bmiCategory,
                    sectionHeaderStyle: sectionHeaderStyle,
                    bodyTextStyle: bodyTextStyle,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(
                          title: 'BMI Calculator',
                          toggleTheme: widget.toggleTheme,
                          isDark: false,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: primaryColor, // Background color
                    foregroundColor: Colors.white, // Text and icon color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12), // Padding inside the button
                    shape: RoundedRectangleBorder(
                      // Rounded corners
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 8, // Shadow elevation
                  ),
                  child: const Text('Re-Calculate',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
