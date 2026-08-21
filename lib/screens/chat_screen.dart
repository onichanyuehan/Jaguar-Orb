import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/chat_provider.dart';
import './theme/app_colors.dart';
import './widgets/chat_bubble.dart';
import './widgets/chat_input_field.dart';
import './widgets/glass_container.dart';
import './widgets/holographic_drawer.dart';
import './widgets/orb_avatar.dart';
import './widgets/space_background.dart';

class ChatScreen extends StatelessWidget {
 const ChatScreen({super.key});

 @override
 Widget build(BuildContext context) {
 final chatProvider = Provider.of<ChatProvider>(context);

 return SpaceBackground(
 child: Scaffold(
 backgroundColor: Colors.transparent,
 drawer: const HolographicDrawer(),
 appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  iconTheme: const IconThemeData(color: AppColors.neonCyan),
  title: Row(
  mainAxisSize: MainAxisSize.min,
  children: const [
  OrbAvatar(size: 28.0, isAnimating: true),
  SizedBox(width: 10.0),
  Text(
  'JAGUAR ORB',
  style: TextStyle(
   color: AppColors.textPrimary,
   fontSize: 16.0,
   fontWeight: FontWeight.bold,
   letterSpacing: 2.0,
  ),
  ),
  ],
  ),
  actions: [
  IconButton(
  icon: const Icon(Icons.tune_rounded, color: AppColors.neonCyan),
  onPressed: () {},
  ),
  ],
 ),
 body: Column(
  children: [
  Expanded(
  child: ListView.builder(
  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
  itemCount: chatProvider.messages.length,
  itemBuilder: (context, index) {
   final message = chatProvider.messages[index];
   return ChatBubble(message: message);
  },
  ),
  ),
  if (chatProvider.isThinking)
  Padding(
  padding: const EdgeInsets.symmetric(
   horizontal: 20.0,
   vertical: 8.0,
  ),
  child: GlassContainer(
   borderRadius: 12.0,
   backgroundColor: AppColors.glassBase,
   borderColor: AppColors.neonCyan.withOpacity(0.3),
   padding: const EdgeInsets.symmetric(
   horizontal: 14.0,
   vertical: 8.0,
   ),
   child: Row(
   mainAxisSize: MainAxisSize.min,
   children: const [
   SizedBox(
   width: 12.0,
   height: 12.0,
   child: CircularProgressIndicator(
    strokeWidth: 1.5,
    color: AppColors.neonCyan,
   ),
   ),
   SizedBox(width: 10.0),
   Text(
   'JAGUAR IS PROCESSING..',
   style: TextStyle(
    color: AppColors.neonCyan,
    fontSize: 11.0,
    letterSpacing: 1.2,
   ),
   ),
   ],
   ),
  ),
  ),
  ChatInputField(
  onSubmitted: (text) => chatProvider.sendMessage(text),
  isThinking: chatProvider.isThinking,
  ),
  ],
 ),
 ),
 );
 }
}
