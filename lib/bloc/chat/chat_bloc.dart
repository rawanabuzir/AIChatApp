import 'package:chatapp/data/model/chat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import 'package:chatapp/data/datasources/messeage_datamodel.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final List<Message> _messages = List.from(messages);

  ChatBloc() : super(ChatLoaded(List.from(messages), showEmojiPicker: false)) {
    on<SendMessageEvent>((event, emit) {
      _messages.add(
        Message(text: event.text, isUser: true, time: DateTime.now()),
      );
      emit(
        ChatLoaded(
          List.from(_messages),
          showEmojiPicker: state is ChatLoaded
              ? (state as ChatLoaded).showEmojiPicker
              : false,
        ),
      );
    });

    on<LoadMessagesEvent>((event, emit) {
      emit(
        ChatLoaded(
          List.from(_messages),
          showEmojiPicker: state is ChatLoaded
              ? (state as ChatLoaded).showEmojiPicker
              : false,
        ),
      );
    });

    on<ToggleEmojiPickerEvent>((event, emit) {
      if (state is ChatLoaded) {
        final currentState = state as ChatLoaded;
        emit(
          ChatLoaded(
            List.from(_messages),
            showEmojiPicker: !currentState.showEmojiPicker,
          ),
        );
      }
    });
  }
}
