import 'dart:convert';

class Message {
  final String text;
  final String sender;
  final DateTime dateCreated;
  Message({
    required this.text,
    required this.sender,
    required this.dateCreated,
  });

  Message copyWith({
    String? text,
    String? sender,
    DateTime? dateCreated,
  }) {
    return Message(
      text: text ?? this.text,
      sender: sender ?? this.sender,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'sender': sender,
      'dateCreated': dateCreated.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      text: map['text'] as String,
      sender: map['sender'] as String,
      dateCreated:
          DateTime.fromMillisecondsSinceEpoch(map['dateCreated'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Message(text: $text, sender: $sender, dateCreated: $dateCreated)';

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.sender == sender &&
        other.dateCreated == dateCreated;
  }

  @override
  int get hashCode => text.hashCode ^ sender.hashCode ^ dateCreated.hashCode;
}
