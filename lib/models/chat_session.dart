class ChatSession {
 final String id;
 final String title;
 final DateTime createdAt;
 final DateTime updatedAt;
 final String lastMessagePreview;

 const ChatSession({
 required this.id,
 required this.title,
 required this.createdAt,
 required this.updatedAt,
 required this.lastMessagePreview,
 });

 ChatSession copyWith({
 String? id,
 String? title,
 DateTime? createdAt,
 DateTime? updatedAt,
 String? lastMessagePreview,
 }) {
 return ChatSession(
 id: id ?? this.id,
 title: title ?? this.title,
 createdAt: createdAt ?? this.createdAt,
 updatedAt: updatedAt ?? this.updatedAt,
 lastMessagePreview: lastMessagePreview ?? this.lastMessagePreview,
 );
 }
}
