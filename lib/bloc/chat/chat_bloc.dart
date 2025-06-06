import 'package:chatapp/data/message_storage.dart';
import 'package:chatapp/data/model/chat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chat_event.dart';
import 'chat_state.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<Message> _messages = [];
  final Gemini _gemini = Gemini.instance;

  ChatBloc() : super(ChatLoading()) {
    on<LoadMessagesEvent>((event, emit) async {
      emit(ChatLoading());
      _messages = await MessageStorage.loadMessages();
      emit(
        ChatLoaded(
          List.from(_messages),
          showEmojiPicker: false,
          isTyping: false,
        ),
      );
    });

    on<SendMessageEvent>((event, emit) async {
      _messages.add(
        Message(text: event.text, isUser: true, time: DateTime.now()),
      );
      await MessageStorage.saveMessages(_messages);

      emit(
        ChatLoaded(
          List.from(_messages),
          showEmojiPicker: state is ChatLoaded
              ? (state as ChatLoaded).showEmojiPicker
              : false,
          isTyping: false,
        ),
      );

      add(TypingEvent(true));

      try {
        final response = await _gemini.text(event.text);

        String geminiResponse = 'لا يوجد رد من الذكاء الاصطناعي.';

        if (response != null &&
            response.content != null &&
            response.content!.parts != null &&
            response.content!.parts!.isNotEmpty) {
          final firstPart = response.content!.parts!.first;
          if (firstPart is TextPart) {
            geminiResponse = firstPart.text;
          } else {
            geminiResponse = 'تم استلام رد غير نصي من الذكاء الاصطناعي.';
          }
        }

        _messages.add(
          Message(text: geminiResponse, isUser: false, time: DateTime.now()),
        );
      } catch (e) {
        _messages.add(
          Message(
            text: 'خطأ في الاتصال بالذكاء الاصطناعي: $e',
            isUser: false,
            time: DateTime.now(),
          ),
        );
      }

      await MessageStorage.saveMessages(_messages);

      add(TypingEvent(false));

      emit(
        ChatLoaded(
          List.from(_messages),
          showEmojiPicker: state is ChatLoaded
              ? (state as ChatLoaded).showEmojiPicker
              : false,
          isTyping: false,
        ),
      );
    });

    on<TypingEvent>((event, emit) {
      if (state is ChatLoaded) {
        final current = state as ChatLoaded;
        emit(current.copyWith(isTyping: event.isTyping));
      }
    });

    on<ToggleEmojiPickerEvent>((event, emit) {
      if (state is ChatLoaded) {
        final currentState = state as ChatLoaded;
        emit(
          ChatLoaded(
            List.from(_messages),
            showEmojiPicker: !currentState.showEmojiPicker,
            isTyping: currentState.isTyping,
          ),
        );
      }
    });
  }
}
