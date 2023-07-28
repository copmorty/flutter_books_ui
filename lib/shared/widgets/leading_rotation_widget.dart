import 'package:flutter/material.dart';
import 'dart:math' as math;

class LeadingRotationWidget extends StatefulWidget {
  final ValueNotifier<double> scrollNotifier;
  final Widget child;
  final double startOffset;

  const LeadingRotationWidget({
    super.key,
    required this.scrollNotifier,
    this.startOffset = 0,
    required this.child,
  });

  @override
  State<LeadingRotationWidget> createState() => _LeadingRotationWidgetState();
}

class _LeadingRotationWidgetState extends State<LeadingRotationWidget> {
  static const double _maxAngle = 90;
  double _rotationAngle = 0;
  double _scale = 1;
  double _opacity = 1;

  @override
  void initState() {
    super.initState();
    widget.scrollNotifier.addListener(updateAngle);
  }

  @override
  void dispose() {
    widget.scrollNotifier.removeListener(updateAngle);
    super.dispose();
  }

  void updateAngle() {
    double itemPosition = (context.findRenderObject() as RenderBox).localToGlobal(Offset.zero).dx;
    double screenWidth = MediaQuery.of(context).size.width;
    double distanceFromScreenLeft = itemPosition - widget.startOffset;
    double newAngle;
    double newOpacity;
    double newScale;

    if (distanceFromScreenLeft < 0) {
      newAngle = ((distanceFromScreenLeft / screenWidth) * -300).clamp(0, _maxAngle);
    } else {
      newAngle = 0;
    }

    newOpacity = opacityMap(newAngle);
    newScale = scaleMap(newAngle);

    setState(() {
      _rotationAngle = newAngle;
      _opacity = newOpacity;
      _scale = newScale;
    });
  }

  double opacityMap(double angle) => (1 - (angle / _maxAngle));

  double scaleMap(double angle) {
    const double minAngle = 0.0;
    const double maxAngle = _maxAngle;
    const double maxScale = 1.0;
    const double minScale = 0.95;

    return maxScale + (minScale - maxScale) * (angle - minAngle) / (maxAngle - minAngle);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity,
      child: Transform(
        transform: Matrix4.identity()
          ..rotateY((math.pi / 180) * _rotationAngle)
          ..scale(_scale),
        alignment: FractionalOffset.centerRight,
        child: widget.child,
      ),
    );
  }
}
