import 'package:flutter/foundation.dart';
import './models/chat_message.dart';
import './models/chat_session.dart';

class ChatProvider with ChangeNotifier {
 List<ChatSession> _sessions = [];
 List<ChatMessage> _messages = [];
 String? _activeSessionId;
 bool _isThinking = false;

 List<ChatSession> get sessions => _sessions;
 List<ChatMessage> get messages => _messages;
 String? get activeSessionId => _activeSessionId;
 bool get isThinking => _isThinking;

 ChatProvider() {
 _loadInitialMockData();
 }

 void _loadInitialMockData() {
 final now = DateTime.now();

 _sessions = [
 ChatSession(
 id: 'session_1',
 title: 'Quantum Neural Network Setup',
 createdAt: now.subtract(const Duration(hours: 2)),
 updatedAt: now.subtract(const Duration(hours: 2)),
 lastMessagePreview: 'System core operational.',
 ),
 ChatSession(
 id: 'session_2',
 title: 'Holographic Matrix Calibration',
 createdAt: now.subtract(const Duration(days: 1)),
 updatedAt: now.subtract(const Duration(days: 1)),
 lastMessagePreview: 'Refraction angles aligned.',
 ),
 ChatSession(
 id: 'session_3',
 title: 'Jaguar Agent Diagnostics',
 createdAt: now.subtract(const Duration(days: 3)),
 updatedAt: now.subtract(const Duration(days: 3)),
 lastMessagePreview: 'All systems optimal.',
 ),
 ];

 _activeSessionId = 'session_1';

 _messages = [
 ChatMessage(
 id: 'msg_1',
 text: 'Jaguar Orb Agent core initialized. How can I assist your operations today?',
 sender: MessageSender.agent,
 timestamp: now.subtract(const Duration(minutes: 10)),
 ),
 ];

 notifyListeners();
 }

 void selectSession(String sessionId) {
 _activeSessionId = sessionId;
 _messages = [
 ChatMessage(
 id: 'msg_init_${DateTime.now().millisecondsSinceEpoch}',
 text: 'Session $sessionId loaded. Core ready.',
 sender: MessageSender.agent,
 timestamp: DateTime.now(),
 ),
 ];
 notifyListeners();
 }

 void createNewSession() {
 final id = 'session_${DateTime.now().millisecondsSinceEpoch}';
 final newSession = ChatSession(
 id: id,
 title: 'New Neural Thread',
 createdAt: DateTime.now(),
 updatedAt: DateTime.now(),
 lastMessagePreview: 'Thread started.',
 );

 _sessions.insert(0, newSession);
 _activeSessionId = id;
 _messages = [
 ChatMessage(
 id: 'msg_init_$id',
 text: 'New core session established. Ask a question or issue a command.',
 sender: MessageSender.agent,
 timestamp: DateTime.now(),
 ),
 ];

 notifyListeners();
 }

 void sendMessage(String text) {
 if (text.trim().isEmpty) return;

 final userMsg = ChatMessage(
 id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
 text: text,
 sender: MessageSender.user,
 timestamp: DateTime.now(),
 );

 _messages.add(userMsg);
 _isThinking = true;
 notifyListeners();

 Future.delayed(const Duration(seconds: 2), () {
 final agentMsg = ChatMessage(
 id: 'msg_reply_${DateTime.now().millisecondsSinceEpoch}',
 text: 'Processed query: "$text". Neural link running at full capacity.',
 sender: MessageSender.agent,
 timestamp: DateTime.now(),
 );

 _messages.add(agentMsg);
 _isThinking = false;
 notifyListeners();
 });
 }
}
