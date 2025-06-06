import 'package:chatapp/data/model/chat_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Message> messages;
  final bool showEmojiPicker;

  ChatLoaded(this.messages, {this.showEmojiPicker = false});
}
