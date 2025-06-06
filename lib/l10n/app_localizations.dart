import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
// /   localizationsDelegates: AppLocalizations.localizationsDelegates,
// /   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @user_info_title.
  ///
  /// In en, this message translates to:
  /// **'Contact Info'**
  String get user_info_title;

  /// No description provided for @appbar_more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get appbar_more;

  /// No description provided for @about_title.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about_title;

  /// No description provided for @about_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Use WhatsApp to contact me 📱'**
  String get about_subtitle;

  /// No description provided for @phone_number_title.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number_title;

  /// No description provided for @media_title.
  ///
  /// In en, this message translates to:
  /// **'Media, Links, and Docs'**
  String get media_title;

  /// No description provided for @media_count.
  ///
  /// In en, this message translates to:
  /// **'15'**
  String get media_count;

  /// No description provided for @common_groups_title.
  ///
  /// In en, this message translates to:
  /// **'Common Groups'**
  String get common_groups_title;

  /// No description provided for @programming_group.
  ///
  /// In en, this message translates to:
  /// **'Programming Group'**
  String get programming_group;

  /// No description provided for @graduation_project_group.
  ///
  /// In en, this message translates to:
  /// **'Graduation Project'**
  String get graduation_project_group;

  /// No description provided for @send_message_action.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get send_message_action;

  /// No description provided for @make_call_action.
  ///
  /// In en, this message translates to:
  /// **'Make Call'**
  String get make_call_action;

  /// No description provided for @share_contact_action.
  ///
  /// In en, this message translates to:
  /// **'Share Contact'**
  String get share_contact_action;

  /// No description provided for @delete_chat_action.
  ///
  /// In en, this message translates to:
  /// **'Delete Chat'**
  String get delete_chat_action;

  /// No description provided for @confirm_title.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm_title;

  /// No description provided for @confirm_message.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the chat?'**
  String get confirm_message;

  /// No description provided for @cancel_button.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel_button;

  /// No description provided for @yes_button.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes_button;

  /// No description provided for @chat_deleted_snackbar.
  ///
  /// In en, this message translates to:
  /// **'Chat deleted'**
  String get chat_deleted_snackbar;

  /// No description provided for @chat_hint.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get chat_hint;

  /// No description provided for @send_icon_semantics.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send_icon_semantics;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
