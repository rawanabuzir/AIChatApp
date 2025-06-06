import 'package:chatapp/data/model/chat_model.dart';

abstract class ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Message> messages;
  final bool showEmojiPicker;
  final bool isTyping;

  ChatLoaded(
    this.messages, {
    this.showEmojiPicker = false,
    this.isTyping = false,
  });

  ChatLoaded copyWith({
    List<Message>? messages,
    bool? showEmojiPicker,
    bool? isTyping,
  }) {
    return ChatLoaded(
      messages ?? this.messages,
      showEmojiPicker: showEmojiPicker ?? this.showEmojiPicker,
      isTyping: isTyping ?? this.isTyping,
    );
  }
}
