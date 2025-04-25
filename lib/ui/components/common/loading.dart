import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

class PulseLoadingIndicator extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color lineColor;
  final Duration duration;

  const PulseLoadingIndicator({
    super.key,
    this.size = 150.0,
    this.backgroundColor = const Color(0xFF30B6C7), // Teal/turquoise color
    this.lineColor = Colors.white,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<PulseLoadingIndicator> createState() => _PulseLoadingIndicatorState();
}

class _PulseLoadingIndicatorState extends State<PulseLoadingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        shape: BoxShape.circle,
      ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: PulsePainter(
              progress: _controller.value,
              lineColor: widget.lineColor,
            ),
          );
        },
      ),
    );
  }
}

class PulsePainter extends CustomPainter {
  final double progress;
  final Color lineColor;

  PulsePainter({
    required this.progress,
    required this.lineColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    // Define the path of the ECG line
    final path = Path();

    // Starting point (left side)
    final startX = center.dx - radius * 0.7;
    path.moveTo(startX, center.dy);

    // First segment - flat line
    path.lineTo(center.dx - radius * 0.3, center.dy);

    // ECG spike up
    path.lineTo(center.dx - radius * 0.2, center.dy - radius * 0.4);

    // ECG spike down
    path.lineTo(center.dx, center.dy + radius * 0.4);

    // ECG spike up again
    path.lineTo(center.dx + radius * 0.2, center.dy - radius * 0.15);

    // End with flat line
    path.lineTo(center.dx + radius * 0.7, center.dy);

    // Create path metrics to animate the drawing
    final PathMetrics pathMetrics = path.computeMetrics();
    final PathMetric pathMetric = pathMetrics.first;

    // Extract the portion of the path based on animation progress
    final Path extractPath = pathMetric.extractPath(
      0.0,
      pathMetric.length * progress,
    );

    // Draw the path
    canvas.drawPath(extractPath, paint);
  }

  @override
  bool shouldRepaint(PulsePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.lineColor != lineColor;
  }
}

// Usage example:
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PulseLoadingIndicator(),
      ),
    );
  }
}