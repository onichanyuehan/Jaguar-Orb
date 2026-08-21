import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/chat_provider.dart';
import './theme/app_colors.dart';
import 'glass_container.dart';
import 'orb_avatar.dart';

class HolographicDrawer extends StatelessWidget {
 const HolographicDrawer({super.key});

 @override
 Widget build(BuildContext context) {
 final chatProvider = Provider.of<ChatProvider>(context);

 return Drawer(
 child: GlassContainer(
 borderRadius: 0.0,
 backgroundColor: AppColors.darkCanvas.withOpacity(0.85),
 borderColor: AppColors.neonCyan.withOpacity(0.3),
 borderWidth: 1.0,
 padding: EdgeInsets.zero,
 child: SafeArea(
 child: Column(
 children: [
 // Header Block
 Padding(
 padding: const EdgeInsets.all(20.0),
 child: Row(
 children: [
 const OrbAvatar(size: 48.0, isAnimating: true),
 const SizedBox(width: 14.0),
 Expanded(
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
 children: const [
 Text(
 'JAGUAR ORB',
 style: TextStyle(
 color: AppColors.neonCyan,
 fontSize: 18.0,
 fontWeight: FontWeight.bold,
 letterSpacing: 2.0,
 ),
 ),
 Text(
 'NEURAL AGENT V1.0',
 style: TextStyle(
 color: AppColors.textSecondary,
 fontSize: 10.0,
 letterSpacing: 1.5,
 ),
 ),
 ],
 ),
 ),
 ],
 ),
 ),
 const Divider(
 color: AppColors.glassBorder,
 height: 1.0,
 ),
 // New Thread Button
 Padding(
 padding: const EdgeInsets.all(16.0),
 child: InkWell(
 onTap: () {
 chatProvider.createNewSession();
 Navigator.pop(context);
 },
 borderRadius: BorderRadius.circular(14.0),
 child: GlassContainer(
 borderRadius: 14.0,
 backgroundColor: AppColors.neonCyan.withOpacity(0.1),
 borderColor: AppColors.neonCyan.withOpacity(0.6),
 padding: const EdgeInsets.symmetric(
 vertical: 12.0,
 horizontal: 16.0,
 ),
 child: Row(
 mainAxisAlignment: MainAxisAlignment.center,
 children: const [
 Icon(
 Icons.add_rounded,
 color: AppColors.neonCyan,
 size: 20.0,
 ),
 SizedBox(width: 8.0),
 Text(
 'NEW NEURAL THREAD',
 style: TextStyle(
 color: AppColors.neonCyan,
 fontWeight: FontWeight.bold,
 fontSize: 12.0,
 letterSpacing: 1.2,
 ),
 ),
 ],
 ),
 ),
 ),
 ),
 // Active Sessions List
 Expanded(
 child: ListView.builder(
 itemCount: chatProvider.sessions.length,
 padding: const EdgeInsets.symmetric(horizontal: 12.0),
 itemBuilder: (context, index) {
 final session = chatProvider.sessions[index];
 final isSelected = session.id == chatProvider.activeSessionId;

 return Padding(
 padding: const EdgeInsets.only(bottom: 8.0),
 child: InkWell(
 onTap: () {
 chatProvider.selectSession(session.id);
 Navigator.pop(context);
 },
 borderRadius: BorderRadius.circular(12.0),
 child: GlassContainer(
 borderRadius: 12.0,
 backgroundColor: isSelected
 ? AppColors.electricPurple.withOpacity(0.2)
 : AppColors.glassDrawer,
 borderColor: isSelected
 ? AppColors.neonCyan
 : AppColors.glassBorder.withOpacity(0.1),
 padding: const EdgeInsets.all(12.0),
 child: Row(
 children: [
 Icon(
 Icons.chat_bubble_outline_rounded,
 size: 16.0,
 color: isSelected
 ? AppColors.neonCyan
 : AppColors.textMuted,
 ),
 const SizedBox(width: 12.0),
 Expanded(
 child: Text(
 session.title,
 maxLines: 1,
 overflow: TextOverflow.ellipsis,
 style: TextStyle(
 color: isSelected
 ? AppColors.textPrimary
 : AppColors.textSecondary,
 fontSize: 13.0,
 fontWeight: isSelected
 ? FontWeight.bold
 : FontWeight.normal,
 ),
 ),
 ),
 ],
 ),
 ),
 ),
 );
 },
 ),
 ),
 // Footer Status
 Padding(
 padding: const EdgeInsets.all(16.0),
 child: Row(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 Container(
 width: 8.0,
 height: 8.0,
 decoration: const BoxDecoration(
 shape: BoxShape.circle,
 color: AppColors.neonCyan,
 boxShadow: [
 BoxShadow(
 color: AppColors.neonCyan,
 blurRadius: 6.0,
 spreadRadius: 1.0,
 ),
 ],
 ),
 ),
 const SizedBox(width: 8.0),
 const Text(
 'CORE STATUS: ONLINE',
 style: TextStyle(
 color: AppColors.textSecondary,
 fontSize: 11.0,
 letterSpacing: 1.5,
 ),
 ),
 ],
 ),
 ),
 ],
 ),
 ),
 ),
 );
 }
}
