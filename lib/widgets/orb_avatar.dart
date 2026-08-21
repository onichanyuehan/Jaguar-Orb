import 'dart:math' as math;
import 'package:flutter/material.dart';
import './theme/app_colors.dart';

class OrbAvatar extends StatefulWidget {
 final double size;
 final bool isAnimating;

 const OrbAvatar({
 super.key,
 this.size = 120.0,
 this.isAnimating = true,
 });

 @override
 State<OrbAvatar> createState() => _OrbAvatarState();
}

class _OrbAvatarState extends State<OrbAvatar> with SingleTickerProviderStateMixin {
 late AnimationController _controller;

 @override
 void initState() {
 super.initState();
 _controller = AnimationController(
  vsync: this,
  duration: const Duration(seconds: 8),
 );

 if (widget.isAnimating) {
  _controller.repeat();
 }
 }

 @override
 void didUpdateWidget(OrbAvatar oldWidget) {
 super.didUpdateWidget(oldWidget);
 if (widget.isAnimating && !_controller.isAnimating) {
  _controller.repeat();
 } else if (!widget.isAnimating && _controller.isAnimating) {
  _controller.stop();
 }
 }

 @override
 void dispose() {
 _controller.dispose();
 super.dispose();
 }

 @override
 Widget build(BuildContext context) {
 return AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
  final double rotation = _controller.value * 2 * math.pi;

  return Container(
   width: widget.size,
   height: widget.size,
   decoration: BoxDecoration(
   shape: BoxShape.circle,
   boxShadow: [
    BoxShadow(
    color: AppColors.neonCyan.withOpacity(0.4),
    blurRadius: widget.size * 0.25,
    spreadRadius: widget.size * 0.05,
    ),
    BoxShadow(
    color: AppColors.electricPurple.withOpacity(0.3),
    blurRadius: widget.size * 0.4,
    spreadRadius: widget.size * 0.08,
    ),
   ],
   ),
   child: Stack(
   alignment: Alignment.center,
   children: [
    // Outer Glowing Aura
    Container(
    width: widget.size,
    height: widget.size,
    decoration: const BoxDecoration(
     shape: BoxShape.circle,
     gradient: AppColors.cyanOrbGradient,
    ),
    ),
    // Rotating Ring Sphere Layer 1
    Transform.rotate(
    angle: rotation,
    child: Container(
     width: widget.size * 0.85,
     height: widget.size * 0.85,
     decoration: BoxDecoration(
     shape: BoxShape.circle,
     gradient: SweepGradient(
      colors: const [
      AppColors.neonCyan,
      AppColors.electricPurple,
      AppColors.laserPink,
      AppColors.neonCyan,
      ],
      transform: GradientRotation(rotation),
     ),
     ),
    ),
    ),
    // Core Glass Sphere
    Container(
    width: widget.size * 0.75,
    height: widget.size * 0.75,
    decoration: BoxDecoration(
     shape: BoxShape.circle,
     gradient: RadialGradient(
     center: const Alignment(-0.3, -0.4),
     radius: 0.8,
     colors: [
      Colors.white.withOpacity(0.9),
      AppColors.holographicBlue.withOpacity(0.6),
      AppColors.electricPurple.withOpacity(0.8),
      AppColors.darkCanvas,
     ],
     stops: const [0.0, 0.3, 0.7, 1.0],
     ),
     border: Border.all(
     color: AppColors.neonCyan.withOpacity(0.6),
     width: 1.5,
     ),
    ),
    ),
    // Top Inner Highlight Refraction
    Positioned(
    top: widget.size * 0.18,
    left: widget.size * 0.25,
    child: Container(
     width: widget.size * 0.3,
     height: widget.size * 0.15,
     decoration: BoxDecoration(
     borderRadius: BorderRadius.all(
      Radius.elliptical(widget.size * 0.3, widget.size * 0.15),
     ),
     gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
      Colors.white.withOpacity(0.6),
      Colors.white.withOpacity(0.0),
      ],
     ),
     ),
    ),
    ),
   ],
   ),
  );
  },
 );
 }
}
