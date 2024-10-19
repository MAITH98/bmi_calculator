import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.child,
    required this.clicked,
  });

  final Widget child;
  final bool clicked;

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    // Use Theme.of(context) to access the theme's colors
    final Color defaultCardColor = Theme.of(context).cardColor; // From theme
    final Color clickedCardColor =
        Theme.of(context).colorScheme.secondary; // For clicked state

    return Card(
      margin: const EdgeInsets.all(10.0),
      color: widget.clicked ? clickedCardColor : defaultCardColor,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        width: double.infinity,
        child: widget.child,
      ),
    );
  }
}
