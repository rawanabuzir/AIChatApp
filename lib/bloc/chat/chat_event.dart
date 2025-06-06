abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String text;
  SendMessageEvent(this.text);
}

class LoadMessagesEvent extends ChatEvent {}

class ToggleEmojiPickerEvent extends ChatEvent {}
