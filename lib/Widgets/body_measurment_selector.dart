import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BodyMeasurmentSelector extends StatefulWidget {
  BodyMeasurmentSelector({
    super.key,
    required this.type,
    required this.value,
    required this.onValueChanged,
  });

  String type;
  double value;
  final ValueChanged<double> onValueChanged;

  @override
  _BodyMeasurmentSelectorState createState() => _BodyMeasurmentSelectorState();
}

class _BodyMeasurmentSelectorState extends State<BodyMeasurmentSelector> {
  @override
  Widget build(BuildContext context) {
    // Access colors from the current theme
    final Color buttonBackgroundColor = Theme.of(context)
        .colorScheme
        .primary; // Button background color from theme
    final TextStyle labelStyle = Theme.of(context)
        .textTheme
        .bodyLarge!; // Text style for labels (Age/Weight)
    final TextStyle valueStyle = Theme.of(context)
        .textTheme
        .headlineLarge!; // Text style for value (bold number)

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.type == 'Age' ? 'Age' : 'Weight', style: labelStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton.filled(
              onPressed: () {
                setState(
                  () {
                    widget.value--;
                    widget.onValueChanged(widget.value);
                  },
                );
              },
              icon: const Icon(Icons.remove),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    buttonBackgroundColor), // Use theme color
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
              ),
            ),
            Text(
              '${widget.value}',
              style: valueStyle,
            ),
            IconButton.filled(
              onPressed: () {
                setState(
                  () {
                    widget.value++;
                    widget.onValueChanged(widget.value);
                  },
                );
              },
              icon: const Icon(Icons.add),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    buttonBackgroundColor), // Use theme color
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(widget.type == 'Age' ? 'Year' : 'Kg', style: labelStyle),
      ],
    );
  }
}
