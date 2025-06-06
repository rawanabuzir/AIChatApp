import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:chatapp/presentation/widgets/appbar/appbar_custom.dart';
import 'package:chatapp/presentation/widgets/background.dart';
import 'package:chatapp/presentation/widgets/message_bubble.dart';
import 'package:chatapp/presentation/widgets/message_input.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatapp/bloc/chat/chat_bloc.dart';
import 'package:chatapp/bloc/chat/chat_event.dart';
import 'package:chatapp/bloc/chat/chat_state.dart';

class ChatScreenView extends StatefulWidget {
  const ChatScreenView({super.key});

  @override
  State<ChatScreenView> createState() => _ChatScreenViewState();
}

class _ChatScreenViewState extends State<ChatScreenView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(LoadMessagesEvent());
  }

  @override
  Widget build(BuildContext context) {
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
                        itemCount: messages.length + (state.isTyping ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (state.isTyping && index == 0) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 100,
                                  height: 40,
                                  child: Lottie.asset(
                                    'assets/animation/typing.json',
                                    repeat: true,
                                  ),
                                ),
                              ),
                            );
                          }

                          final msg =
                              messages[messages.length -
                                  1 -
                                  (index - (state.isTyping ? 1 : 0))];

                          bool showTime = true;
                          if (index > (state.isTyping ? 1 : 0)) {
                            final nextMsg =
                                messages[messages.length -
                                    (index - (state.isTyping ? 1 : 0))];
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
                color: Colors.white.withOpacity(0.9),
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
