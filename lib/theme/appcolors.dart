import 'package:flutter/material.dart';

class AppColors {
 AppColors._();

 // Dark Space Background Base
 static const Color spaceBackground = Color(0xFF070B19);
 static const Color darkCanvas = Color(0xFF03050C);

 // Holographic & Neon Accents
 static const Color neonCyan = Color(0xFF00F0FF);
 static const Color electricPurple = Color(0xFF8A2BE2);
 static const Color holographicBlue = Color(0xFF4DEEEA);
 static const Color laserPink = Color(0xFFFF007F);

 // Glassmorphic Surface Colors
 static const Color glassBase = Color(0x1AFFFFFF);
 static const Color glassBorder = Color(0x3300F0FF);
 static const Color glassDrawer = Color(0x0DFFFFFF);

 // Glow & Overlay Colors
 static const Color cyanGlow = Color(0x6600F0FF);
 static const Color purpleGlow = Color(0x668A2BE2);

 // Text Colors
 static const Color textPrimary = Color(0xFFE0F7FA);
 static const Color textSecondary = Color(0xFF80DEEA);
 static const Color textMuted = Color(0xFF455A64);

 // Radial Gradients for Background Ambient Lights
 static const RadialGradient cyanOrbGradient = RadialGradient(
  colors: [
   Color(0x9900F0FF),
   Color(0x3300F0FF),
   Color(0x0000F0FF),
  ],
  stops: [0.0, 0.5, 1.0],
 );

 static const RadialGradient purpleOrbGradient = RadialGradient(
  colors: [
   Color(0x998A2BE2),
   Color(0x338A2BE2),
   Color(0x008A2BE2),
  ],
  stops: [0.0, 0.5, 1.0],
 );
}
