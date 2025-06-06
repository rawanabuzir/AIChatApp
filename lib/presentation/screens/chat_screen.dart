import 'package:flutter/material.dart';

import 'package:chatapp/presentation/widgets/appbar/appbar_custom.dart';
import 'package:chatapp/presentation/widgets/background.dart';
import 'package:chatapp/presentation/widgets/message_bubble.dart';
import 'package:chatapp/presentation/widgets/message_input.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatapp/bloc/chat/chat_bloc.dart';
import 'package:chatapp/bloc/chat/chat_event.dart';
import 'package:chatapp/bloc/chat/chat_state.dart';

class ChatScreenView extends StatelessWidget {
  ChatScreenView({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatBloc>().add(LoadMessagesEvent());
    });

    return Scaffold(
      backgroundColor: const Color.fromARGB(210, 165, 122, 122),
      extendBodyBehindAppBar: true,
      appBar: AppbarCustom(
        username: 'Rwuna 😎',
        imagePath: 'assets/images/user.webp',
        lastSeen: 'Online',
        onCallPressed: () {},
        onMenuPressed: () {},
      ),
      body: Stack(
        children: [
          Background(),
          Column(
            children: [
              const SizedBox(height: kToolbarHeight + 10),
              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    if (state is ChatLoaded) {
                      final messages = state.messages;
                      return ListView.builder(
                        reverse: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final msg = messages[messages.length - 1 - index];
                          bool showTime = true;
                          if (index > 0) {
                            final nextMsg = messages[messages.length - index];
                            final sameSender = msg.isUser == nextMsg.isUser;
                            final sameMinute =
                                msg.time.difference(nextMsg.time).inMinutes ==
                                0;
                            if (sameSender && sameMinute) showTime = false;
                          }
                          return MessageBubble(
                            message: msg,
                            showTime: showTime,
                          );
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Container(
                color: Colors.white.withValues(alpha: 0.9),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 10,
                ),
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    bool showEmojiPicker = false;
                    if (state is ChatLoaded) {
                      showEmojiPicker = state.showEmojiPicker;
                    }
                    return MessageInput(
                      controller: _controller,
                      showEmojiPicker: showEmojiPicker,
                      onEmojiToggle: () {
                        context.read<ChatBloc>().add(ToggleEmojiPickerEvent());
                      },
                      onSend: () {
                        final text = _controller.text.trim();
                        if (text.isNotEmpty) {
                          context.read<ChatBloc>().add(SendMessageEvent(text));
                          _controller.clear();
                        }
                      },
                      onEmojiSelected: (emoji) {
                        _controller.text += emoji.emoji;
                        _controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: _controller.text.length),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
