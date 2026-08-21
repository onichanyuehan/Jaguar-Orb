import 'package:flutter/material.dart';
import './theme/app_colors.dart';
import 'glass_container.dart';

class ChatInputField extends StatefulWidget {
 final Function(String) onSubmitted;
 final bool isThinking;

 const ChatInputField({
 super.key,
 required this.onSubmitted,
 required this.isThinking,
 });

 @override
 State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
 final TextEditingController _controller = TextEditingController();

 void _handleSend() {
 final text = _controller.text.trim();
 if (text.isNotEmpty && !widget.isThinking) {
 widget.onSubmitted(text);
 _controller.clear();
 }
 }

 @override
 void dispose() {
 _controller.dispose();
 super.dispose();
 }

 @override
 Widget build(BuildContext context) {
 return Padding(
 padding: const EdgeInsets.all(16.0),
 child: GlassContainer(
 borderRadius: 28.0,
 backgroundColor: AppColors.glassBase,
 borderColor: AppColors.neonCyan.withOpacity(0.4),
 borderWidth: 1.2,
 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
 child: Row(
 children: [
 Expanded(
 child: TextField(
 controller: _controller,
 enabled: !widget.isThinking,
 style: const TextStyle(
 color: AppColors.textPrimary,
 fontSize: 15.0,
 ),
 cursorColor: AppColors.neonCyan,
 decoration: InputDecoration(
 hintText: widget.isThinking
 ? 'Processing neural response..'
 : 'Command or query Jaguar Agent..',
 hintStyle: TextStyle(
 color: AppColors.textMuted.withOpacity(0.8),
 fontSize: 14.0,
 ),
 border: InputBorder.none,
 contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
 ),
 onSubmitted: (_) => _handleSend(),
 ),
 ),
 const SizedBox(width: 8.0),
 Container(
 decoration: BoxDecoration(
 shape: BoxShape.circle,
 gradient: LinearGradient(
 colors: widget.isThinking
 ? [Colors.grey, Colors.black45]
 : [AppColors.neonCyan, AppColors.electricPurple],
 ),
 boxShadow: widget.isThinking
 ? []
 : [
 BoxShadow(
 color: AppColors.neonCyan.withOpacity(0.5),
 blurRadius: 10.0,
 spreadRadius: 1.0,
 ),
 ],
 ),
 child: IconButton(
 icon: widget.isThinking
 ? const SizedBox(
 width: 18.0,
 height: 18.0,
 child: CircularProgressIndicator(
 strokeWidth: 2.0,
 color: AppColors.neonCyan,
 ),
 )
 : const Icon(
 Icons.send_rounded,
 color: Colors.black,
 size: 20.0,
 ),
 onPressed: widget.isThinking ? null : _handleSend,
 ),
 ),
 ],
 ),
 ),
 );
 }
}
