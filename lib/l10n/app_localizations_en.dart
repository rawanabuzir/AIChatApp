// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get user_info_title => 'Contact Info';

  @override
  String get appbar_more => 'More';

  @override
  String get about_title => 'About';

  @override
  String get about_subtitle => 'Use WhatsApp to contact me 📱';

  @override
  String get phone_number_title => 'Phone Number';

  @override
  String get media_title => 'Media, Links, and Docs';

  @override
  String get media_count => '15';

  @override
  String get common_groups_title => 'Common Groups';

  @override
  String get programming_group => 'Programming Group';

  @override
  String get graduation_project_group => 'Graduation Project';

  @override
  String get send_message_action => 'Send Message';

  @override
  String get make_call_action => 'Make Call';

  @override
  String get share_contact_action => 'Share Contact';

  @override
  String get delete_chat_action => 'Delete Chat';

  @override
  String get confirm_title => 'Confirm';

  @override
  String get confirm_message => 'Are you sure you want to delete the chat?';

  @override
  String get cancel_button => 'Cancel';

  @override
  String get yes_button => 'Yes';

  @override
  String get chat_deleted_snackbar => 'Chat deleted';

  @override
  String get chat_hint => 'Type a message...';

  @override
  String get send_icon_semantics => 'Send';
}
