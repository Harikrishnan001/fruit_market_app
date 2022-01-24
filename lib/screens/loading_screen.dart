import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants.dart';
import 'dart:math' as Math;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);
  static const String routeName = "Loading";

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _verified = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        lowerBound: 0.0,
        upperBound: 8.0);
    _animationController.repeat();
    //TODO:implement verification
    Future.delayed(Duration(seconds: 4), () {
      _setDone();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _setDone() {
    _verified = true;
    _animationController.stop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 100),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.width / 1.5,
              width: MediaQuery.of(context).size.width / 1.5,
              child: CustomPaint(
                isComplex: true,
                painter: _verified
                    ? TickPainter()
                    : LoadingPainter(
                        animation: _animationController,
                      ),
              ),
            ),
          ),
          if (!_verified)
            Text(
              'Verifying your mobile number',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(),
            ),
          if (_verified)
            Text(
              'Verification code send on \nyour registered mobile number',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(),
            ),
        ],
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  final Animation<double> animation;

  LoadingPainter({required this.animation}) : super(repaint: animation);
  @override
  void paint(Canvas canvas, Size size) {
    const int div = 8;
    final barHeight = size.width / 8;
    Offset center = Offset(size.width / 2, size.width / 2);
    final innerRadius = size.width / 6;
    final outerRadius = innerRadius + barHeight;
    final paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;
    final frac = animation.value.floor();

    for (int i = 0; i <= div; i += 1) {
      final theta = _rad(360.0 * i / div);
      final alpha =
          ((255 * (div - i) / div).floor() + (255 * frac / div)).floor() % 256;

      canvas.drawLine(
          center +
              Offset(
                  innerRadius * Math.cos(theta), innerRadius * Math.sin(theta)),
          center +
              Offset(
                  outerRadius * Math.cos(theta), outerRadius * Math.sin(theta)),
          paint..color = primaryColor.withAlpha(alpha));
    }
  }

  @override
  bool shouldRepaint(LoadingPainter oldDelegate) => true;

  double _rad(double deg) {
    return (Math.pi / 180.0) * deg;
  }
}

class TickPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 3, paint);
    canvas.drawLine(center - const Offset(40.0, 0),
        center - const Offset(20.0, -20.0), paint);
    canvas.drawLine(center - const Offset(20.0, -20.0),
        center + Offset(size.width / 8, -size.width / 8), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
