import 'dart:ui';
import 'package:flutter/material.dart';
import './theme/app_colors.dart';

class GlassContainer extends StatelessWidget {
 final Widget child;
 final double blurX;
 final double blurY;
 final double borderRadius;
 final Color backgroundColor;
 final Color borderColor;
 final double borderWidth;
 final EdgeInsetsGeometry? padding;
 final EdgeInsetsGeometry? margin;
 final AlignmentGeometry? alignment;
 final double? width;
 final double? height;

 const GlassContainer({
 super.key,
 required this.child,
 this.blurX = 15.0,
 this.blurY = 15.0,
 this.borderRadius = 20.0,
 this.backgroundColor = AppColors.glassBase,
 this.borderColor = AppColors.glassBorder,
 this.borderWidth = 1.0,
 this.padding,
 this.margin,
 this.alignment,
 this.width,
 this.height,
 });

 @override
 Widget build(BuildContext context) {
 return Container(
  width: width,
  height: height,
  margin: margin,
  alignment: alignment,
  child: ClipRRect(
  borderRadius: BorderRadius.circular(borderRadius),
  child: BackdropFilter(
   filter: ImageFilter.blur(
   sigmaX: blurX,
   sigmaY: blurY,
   ),
   child: Container(
   padding: padding,
   decoration: BoxDecoration(
    color: backgroundColor,
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(
    color: borderColor,
    width: borderWidth,
    ),
   ),
   child: child,
   ),
  ),
  ),
 );
 }
}
