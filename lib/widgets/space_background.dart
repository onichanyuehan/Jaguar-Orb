import 'dart:math' as math;
import 'package:flutter/material.dart';
import './theme/app_colors.dart';

class SpaceBackground extends StatefulWidget {
 final Widget child;

 const SpaceBackground({
 super.key,
 required this.child,
 });

 @override
 State<SpaceBackground> createState() => _SpaceBackgroundState();
}

class _SpaceBackgroundState extends State<SpaceBackground>
  with SingleTickerProviderStateMixin {
 late AnimationController _controller;

 @override
 void initState() {
 super.initState();
 _controller = AnimationController(
  vsync: this,
  duration: const Duration(seconds: 20),
 ).repeat(reverse: true);
 }

 @override
 void dispose() {
 _controller.dispose();
 super.dispose();
 }

 @override
 Widget build(BuildContext context) {
 return Stack(
  children: [
  Container(
   color: AppColors.darkCanvas,
  ),
  AnimatedBuilder(
   animation: _controller,
   builder: (context, child) {
   return CustomPaint(
    size: Size.infinite,
    painter: HolographicGridPainter(progress: _controller.value),
   );
   },
  ),
  Positioned(
   top: -100,
   left: -50,
   child: Container(
   width: 300,
   height: 300,
   decoration: const BoxDecoration(
    shape: BoxShape.circle,
    gradient: AppColors.cyanOrbGradient,
   ),
   ),
  ),
  Positioned(
   bottom: -80,
   right: -50,
   child: Container(
   width: 350,
   height: 350,
   decoration: const BoxDecoration(
    shape: BoxShape.circle,
    gradient: AppColors.purpleOrbGradient,
   ),
   ),
  ),
  widget.child,
  ],
 );
 }
}

class HolographicGridPainter extends CustomPainter {
 final double progress;

 HolographicGridPainter({required this.progress});

 @override
 void paint(Canvas canvas, Size size) {
 final Paint linePaint = Paint()
  .color = AppColors.neonCyan.withOpacity(0.04)
  .strokeWidth = 1.0
  .style = PaintingStyle.stroke;

 final double step = 40.0;
 final double offsetY = progress * step;

 for (double x = 0; x < size.width; x += step) {
  canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
 }

 for (double y = 0; y < size.height + step; y += step) {
  final double currentY = (y + offsetY) % size.height;
  canvas.drawLine(
  Offset(0, currentY),
  Offset(size.width, currentY),
  linePaint,
  );
 }

 final math.Random random = math.Random(42);
 final Paint particlePaint = Paint().style = PaintingStyle.fill;

 for (int i = 0; i < 30; i++) {
  final double px = random.nextDouble() * size.width;
  final double py = (random.nextDouble() * size.height + offsetY) % size.height;
  final double radius = random.nextDouble() * 1.8 + 0.5;

  particlePaint.color = i % 2 == 0
    ? AppColors.neonCyan.withOpacity(random.nextDouble() * 0.4 + 0.1)
    : AppColors.electricPurple.withOpacity(random.nextDouble() * 0.4 + 0.1);

  canvas.drawCircle(Offset(px, py), radius, particlePaint);
 }
 }

 @override
 bool shouldRepaint(covariant HolographicGridPainter oldDelegate) {
 return oldDelegate.progress != progress;
 }
}
