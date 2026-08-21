import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './models/chat_message.dart';
import './theme/app_colors.dart';
import 'glass_container.dart';
import 'orb_avatar.dart';

class ChatBubble extends StatelessWidget {
 final ChatMessage message;

 const ChatBubble({
 super.key,
 required this.message,
 });

 @override
 Widget build(BuildContext context) {
 final isUser = message.sender == MessageSender.user;
 final formattedTime = DateFormat('HH:mm').format(message.timestamp);

 return Padding(
 padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
 child: Row(
 mainAxisAlignment:
  isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
 crossAxisAlignment: CrossAxisAlignment.start,
 children: [
  if (!isUser) ..[
  const OrbAvatar(size: 32, isAnimating: false),
  const SizedBox(width: 10),
  ],
  Flexible(
  child: GlassContainer(
  borderRadius: 16.0,
  backgroundColor: isUser
   ? AppColors.neonCyan.withOpacity(0.12)
   : AppColors.glassBase,
  borderColor: isUser
   ? AppColors.neonCyan.withOpacity(0.5)
   : AppColors.electricPurple.withOpacity(0.4),
  padding: const EdgeInsets.all(14.0),
  child: Column(
   crossAxisAlignment: isUser
    ? CrossAxisAlignment.end
    : CrossAxisAlignment.start,
   children: [
   Text(
   message.text,
   style: const TextStyle(
    color: AppColors.textPrimary,
    fontSize: 15.0,
    height: 1.4,
    letterSpacing: 0.5,
   ),
   ),
   const SizedBox(height: 6.0),
   Text(
   formattedTime,
   style: TextStyle(
    color: AppColors.textSecondary.withOpacity(0.6),
    fontSize: 10.0,
    letterSpacing: 1.0,
   ),
   ),
   ],
  ),
  ),
  ),
  if (isUser) const SizedBox(width: 8.0),
 ],
 ),
 );
 }
}
