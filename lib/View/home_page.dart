import 'package:bmi/Models/bmi_model.dart';
import 'package:bmi/View/bmi_result_page.dart';
import 'package:flutter/material.dart';
import '../Widgets/custom_card.dart';
import '../Widgets/body_measurment_selector.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.toggleTheme, // Accept toggleTheme function
    required this.isDark, // Accept isDark boolean
  });

  final String title;
  final VoidCallback toggleTheme;
  final bool isDark;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isfemale = false;
  bool ismale = true;
  double userHeight = 180;
  List<double> slider = [280, 20];
  List<bool> measurementUnit = [false, false, true];
  String unit = 'Cm';

  double weight = 65;
  double age = 27;

  double _bmi = 0; // Store BMI value
  String _bmiCategory = '0'; // Store BMI category

  void updateUnit() {
    measurementUnit[0] ? unit = 'In' : {};
    measurementUnit[1] ? unit = 'Ft' : {};
    measurementUnit[2] ? unit = 'Cm' : {};
  }

  void _calculateBMI() {
    print(userHeight);
    print(age);
    print(weight);
    // Create BMI model and calculate BMI
    BMIModel bmiModel = BMIModel(
      height: measurementUnit[2]
          ? userHeight
          : (measurementUnit[0] ? (userHeight * 2.54) : (userHeight * 30.48)),
      weight: weight,
      age: age.toInt(),
      gender: isfemale ? 'Female' : 'Male',
    );

    setState(() {
      _bmi = bmiModel.calculateBMI();
      _bmiCategory = bmiModel.getBMICategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor; // From Theme
    final Color secondaryColor =
        Theme.of(context).colorScheme.secondary; // From Theme
    final TextStyle titleStyle =
        Theme.of(context).textTheme.headlineLarge!; // From Theme
    final TextStyle labelStyle =
        Theme.of(context).textTheme.bodyLarge!; // From Theme
    final TextStyle valueStyle =
        Theme.of(context).textTheme.headlineMedium!; // From Theme

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 10, // Adds shadow beneath the AppBar
          shadowColor:
              Colors.black54, // Shadow color, you can adjust its opacity
          titleSpacing: 0, // Adjusts spacing to align with leading icon
          title: const Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10.0), // Space above and beneath the title
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
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
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      splashColor: secondaryColor.withAlpha(80),
                      onTap: () {
                        debugPrint('Card tapped.');
                        setState(() {
                          updateUnit();
                          ismale = !ismale;
                          ismale ? isfemale = false : isfemale = isfemale;
                        });
                      },
                      child: CustomCard(
                        clicked: ismale,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male, color: primaryColor, size: 80),
                            Text(
                              'Male',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      splashColor: secondaryColor.withAlpha(80),
                      onTap: () {
                        debugPrint('Card tapped.');
                        setState(() {
                          updateUnit();
                          isfemale = !isfemale;
                          isfemale ? ismale = false : ismale = ismale;
                        });
                      },
                      child: CustomCard(
                        clicked: isfemale,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female, color: primaryColor, size: 80),
                            Text(
                              'Female',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomCard(
                  clicked: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('    HEIGHT'),
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: measurementUnit[0]
                                      ? primaryColor
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  shape: BoxShape.circle,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    double newheight = userHeight;
                                    measurementUnit[0]
                                        ? {}
                                        : {
                                            measurementUnit[1]
                                                ? {
                                                    newheight *= 12,
                                                    slider = [
                                                      slider[0] * 12,
                                                      slider[1] * 12
                                                    ]
                                                  }
                                                : {}, // From Ft to In * 12
                                            measurementUnit[2]
                                                ? {
                                                    newheight /= 2.54,
                                                    slider = [
                                                      slider[0] / 2.54,
                                                      slider[1] / 2.54
                                                    ]
                                                  }
                                                : {}, // From Cm to In
                                            setState(() {
                                              userHeight = newheight;
                                              measurementUnit = [
                                                true,
                                                false,
                                                false
                                              ];
                                              updateUnit();
                                            }),
                                          };
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets
                                        .zero, // Remove extra padding from the button
                                  ),
                                  child: Text(
                                    'In',
                                    style: TextStyle(
                                        color: measurementUnit[0]
                                            ? const Color.fromARGB(
                                                255, 255, 255, 255)
                                            : primaryColor,
                                        fontSize:
                                            16), // Adjust font size as necessary
                                    textAlign: TextAlign
                                        .center, // Center-align the text
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: measurementUnit[1]
                                      ? primaryColor
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  shape: BoxShape.circle,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    double newheight = userHeight;
                                    measurementUnit[1]
                                        ? {}
                                        : {
                                            measurementUnit[0]
                                                ? {
                                                    newheight /= 12,
                                                    slider = [
                                                      slider[0] / 12,
                                                      slider[1] / 12
                                                    ]
                                                  }
                                                : {}, // From In to Ft / 12
                                            measurementUnit[2]
                                                ? {
                                                    newheight /= 30.48,
                                                    slider = [
                                                      slider[0] / 30.48,
                                                      slider[1] / 30.48
                                                    ]
                                                  }
                                                : {}, // From Cm to Ft / 30.48
                                            setState(() {
                                              userHeight = newheight;
                                              measurementUnit = [
                                                false,
                                                true,
                                                false
                                              ];
                                              updateUnit();
                                            }),
                                          };
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets
                                        .zero, // Remove extra padding from the button
                                  ),
                                  child: Text(
                                    'Ft',
                                    style: TextStyle(
                                        color: measurementUnit[1]
                                            ? const Color.fromARGB(
                                                255, 255, 255, 255)
                                            : primaryColor,
                                        fontSize:
                                            16), // Adjust font size as necessary
                                    textAlign: TextAlign
                                        .center, // Center-align the text
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: measurementUnit[2]
                                      ? primaryColor
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  shape: BoxShape.circle,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    double newheight = userHeight;
                                    measurementUnit[2]
                                        ? {}
                                        : {
                                            measurementUnit[0]
                                                ? {
                                                    newheight *= 2.54,
                                                    slider = [
                                                      slider[0] * 2.54,
                                                      slider[1] * 2.54
                                                    ]
                                                  }
                                                : {}, // From In to Cm
                                            measurementUnit[1]
                                                ? {
                                                    newheight *= 30.48,
                                                    slider = [
                                                      slider[0] * 30.48,
                                                      slider[1] * 30.48
                                                    ]
                                                  }
                                                : {}, // From Ft to Cm
                                            setState(() {
                                              userHeight = newheight;
                                              measurementUnit = [
                                                false,
                                                false,
                                                true
                                              ];
                                              updateUnit();
                                            }),
                                          };
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets
                                        .zero, // Remove extra padding from the button
                                  ),
                                  child: Center(
                                    // Center the text inside the circular button
                                    child: Text(
                                      'Cm',
                                      style: TextStyle(
                                          color: measurementUnit[2]
                                              ? const Color.fromARGB(
                                                  255, 255, 255, 255)
                                              : primaryColor,
                                          fontSize:
                                              16), // Adjust font size as necessary
                                      textAlign: TextAlign
                                          .center, // Center-align the text
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${userHeight.toInt()}',
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('$unit'),
                        ],
                      ),
                      Slider(
                        value: userHeight,
                        max: slider[0],
                        min: slider[1],
                        onChanged: (double value) {
                          setState(() {
                            updateUnit();
                            userHeight = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      clicked: false,
                      child: BodyMeasurmentSelector(
                        value: weight,
                        type: 'Weight',
                        onValueChanged: (newValue) {
                          setState(() {
                            weight =
                                newValue; // Update the weight in the parent widget
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      clicked: false,
                      child: BodyMeasurmentSelector(
                        value: age,
                        type: 'Age',
                        onValueChanged: (newValue) {
                          setState(() {
                            age =
                                newValue; // Update the weight in the parent widget
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    _calculateBMI(); // Calculate BMI
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMIResult(
                          bmi: _bmi,
                          bmiCategory: _bmiCategory,
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
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Calculate', style: TextStyle(fontSize: 20)),
                      SizedBox(
                          width: 8), // Optional space between text and icon
                      Icon(Icons.cached),
                    ],
                  ),
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
