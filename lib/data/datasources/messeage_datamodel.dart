import 'package:chatapp/data/model/chat_model.dart';

final List<Message> messages = [
  Message(
    text: 'أهلاً! كيفك اليوم؟ 😊',
    isUser: false,
    time: DateTime.now().subtract(const Duration(minutes: 5)),
  ),
  Message(
    text: 'تمام الحمد لله! وانت؟ 😄',
    isUser: true,
    time: DateTime.now().subtract(const Duration(minutes: 4)),
  ),

  Message(
    text: 'شكراً! إذا عندك أي اقتراحات خبرني 😊',
    isUser: true,
    time: DateTime.now().add(const Duration(minutes: 5)),
  ),
];
