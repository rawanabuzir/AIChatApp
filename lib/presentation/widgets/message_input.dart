import 'package:flutter/material.dart';
import 'package:chatapp/l10n/app_localizations.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

class MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final bool showEmojiPicker;
  final VoidCallback onEmojiToggle;
  final VoidCallback onSend;
  final void Function(Emoji) onEmojiSelected;

  const MessageInput({
    super.key,
    required this.controller,
    required this.showEmojiPicker,
    required this.onEmojiToggle,
    required this.onSend,
    required this.onEmojiSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.emoji_emotions_outlined),
              color: Colors.grey,
              onPressed: onEmojiToggle,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.chat_hint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onSend,
              child: const CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(Icons.send, color: Colors.white),
              ),
            ),
          ],
        ),
        if (showEmojiPicker)
          SizedBox(
            height: 250,
            child: EmojiPicker(
              onEmojiSelected: (category, emoji) => onEmojiSelected(emoji),
              config: Config(
                height: 256,
                checkPlatformCompatibility: true,
                bottomActionBarConfig: BottomActionBarConfig(
                  backgroundColor: Colors.transparent,
                  buttonColor: Colors.transparent,
                  buttonIconColor: Colors.teal,
                ),
                emojiViewConfig: EmojiViewConfig(
                  emojiSizeMax:
                      28 *
                      (foundation.defaultTargetPlatform == TargetPlatform.iOS
                          ? 1.2
                          : 1.0),
                  columns: 7,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
