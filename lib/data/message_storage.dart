import 'dart:convert';
import 'dart:io';
import 'package:chatapp/data/model/chat_model.dart';
import 'package:path_provider/path_provider.dart';

class MessageStorage {
  static Future<File> _getMessagesFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/messages.json');
  }

  static Future<List<Message>> loadMessages() async {
    try {
      final file = await _getMessagesFile();
      if (!await file.exists()) return [];
      final content = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(content);
      return jsonList.map((json) => Message.fromJson(json)).toList();
    } catch (e) {
      print('Error loading messages: $e');
      return [];
    }
  }

  static Future<void> saveMessages(List<Message> messages) async {
    final file = await _getMessagesFile();
    final jsonList = messages.map((m) => m.toJson()).toList();
    await file.writeAsString(jsonEncode(jsonList));
  }
}
