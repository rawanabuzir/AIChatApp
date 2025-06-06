abstract class ChatEvent {}

class LoadMessagesEvent extends ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String text;
  SendMessageEvent(this.text);
}

class TypingEvent extends ChatEvent {
  final bool isTyping;
  TypingEvent(this.isTyping);
}

class ToggleEmojiPickerEvent extends ChatEvent {}
