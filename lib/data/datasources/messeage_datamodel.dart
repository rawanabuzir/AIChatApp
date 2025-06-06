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
    text: 'الحمد لله، عم بشتغل على تطبيق جديد 💻',
    isUser: false,
    time: DateTime.now().subtract(const Duration(minutes: 3)),
  ),
  Message(
    text: 'واو! شو نوعه؟ 🤔',
    isUser: true,
    time: DateTime.now().subtract(const Duration(minutes: 2)),
  ),
  Message(
    text: 'تطبيق شات ذكي باستخدام Gemini 😍',
    isUser: false,
    time: DateTime.now().subtract(const Duration(minutes: 1)),
  ),
  Message(
    text: 'يا سلام! بدي جربه لما يخلص 👍',
    isUser: true,
    time: DateTime.now(),
  ),
  Message(text: 'أكيد! رح يكون رائع 😎', isUser: false, time: DateTime.now()),
  Message(
    text: 'شكراً! إذا عندك أي اقتراحات خبرني 😊',
    isUser: true,
    time: DateTime.now().add(const Duration(minutes: 1)),
  ),
  Message(
    text: 'شكراً! إذا عندك أي اقتراحات خبرني 😊',
    isUser: true,
    time: DateTime.now().add(const Duration(minutes: 1)),
  ),
  Message(
    text: 'أكيد! رح يكون رائع 😎',
    isUser: false,
    time: DateTime.now().add(const Duration(minutes: 2)),
  ),
  Message(
    text: 'شكراً! إذا عندك أي اقتراحات خبرني 😊',
    isUser: true,
    time: DateTime.now().add(const Duration(minutes: 3)),
  ),
  Message(
    text: 'أكيد! رح يكون رائع 😎',
    isUser: false,
    time: DateTime.now().add(const Duration(minutes: 4)),
  ),
  Message(
    text: 'شكراً! إذا عندك أي اقتراحات خبرني 😊',
    isUser: true,
    time: DateTime.now().add(const Duration(minutes: 5)),
  ),
  Message(
    text: 'شكراً! إذا عندك أي اقتراحات خبرني 😊',
    isUser: true,
    time: DateTime.now().add(const Duration(minutes: 5)),
  ),
  Message(
    text: 'شكراً! إذا عندك أي اقتراحات خبرني 😊',
    isUser: true,
    time: DateTime.now().add(const Duration(minutes: 5)),
  ),
  Message(
    text: 'شكراً! إذا عندك أي اقتراحات خبرني 😊',
    isUser: true,
    time: DateTime.now().add(const Duration(minutes: 5)),
  ),
];
