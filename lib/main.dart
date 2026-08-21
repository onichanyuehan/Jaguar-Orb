import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/chat_provider.dart';
import 'screens/chat_screen.dart';
import 'theme/app_theme.dart';

void main() {
 WidgetsFlutterBinding.ensureInitialized();
 
 SystemChrome.setPreferredOrientations([
 DeviceOrientation.portraitUp,
 DeviceOrientation.portraitDown,
 ]);

 SystemChrome.setSystemUIOverlayStyle(
 const SystemUiOverlayStyle(
 statusBarColor: Colors.transparent,
 statusBarIconBrightness: Brightness.light,
 systemNavigationBarColor: Colors.black,
 systemNavigationBarIconBrightness: Brightness.light,
 ),
 );

 runApp(const JaguarOrbApp());
}

class JaguarOrbApp extends StatelessWidget {
 const JaguarOrbApp({super.key});

 @override
 Widget build(BuildContext context) {
 return ChangeNotifierProvider(
 create: (_) => ChatProvider(),
 child: MaterialApp(
 title: 'Jaguar Orb Agent',
 debugShowCheckedModeBanner: false,
 theme: AppTheme.darkHolographicTheme,
 home: const ChatScreen(),
 ),
 );
 }
}
