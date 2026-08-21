enum MessageSender {
 user,
 agent,
}

enum MessageStatus {
 sending,
 sent,
 error,
}

class ChatMessage {
 final String id;
 final String text;
 final MessageSender sender;
 final DateTime timestamp;
 final MessageStatus status;

 const ChatMessage({
 required this.id,
 required this.text,
 required this.sender,
 required this.timestamp,
 this.status = MessageStatus.sent,
 });

 ChatMessage copyWith({
 String? id,
 String? text,
 MessageSender? sender,
 DateTime? timestamp,
 MessageStatus? status,
 }) {
 return ChatMessage(
  id: id ?? this.id,
  text: text ?? this.text,
  sender: sender ?? this.sender,
  timestamp: timestamp ?? this.timestamp,
  status: status ?? this.status,
 );
 }
}
