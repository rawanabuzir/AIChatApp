import 'package:flutter/material.dart';
import 'package:chatapp/l10n/app_localizations.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.user_info_title),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/user.webp'),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              'User Name Here',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              '+962 7XXX XXXX',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.teal),
            title: Text(AppLocalizations.of(context)!.about_title),
            subtitle: Text(AppLocalizations.of(context)!.about_subtitle),
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.teal),
            title: Text(AppLocalizations.of(context)!.phone_number_title),
            subtitle: Text('+962 7XXX XXXX'),
            trailing: const Icon(Icons.chat, color: Colors.teal),
          ),

          const Divider(),

          // Media
          ListTile(
            leading: const Icon(Icons.photo_library, color: Colors.teal),
            title: Text(AppLocalizations.of(context)!.media_title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppLocalizations.of(context)!.media_count),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),

          const Divider(),

          // Common groups
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(context)!.common_groups_title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),

          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(Icons.group, color: Colors.white),
            ),
            title: Text(AppLocalizations.of(context)!.programming_group),
            onTap: () {},
          ),

          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(Icons.group, color: Colors.white),
            ),
            title: Text(AppLocalizations.of(context)!.graduation_project_group),
            onTap: () {},
          ),

          const Divider(),

          // Bottom actions
          ListTile(
            leading: const Icon(Icons.chat, color: Colors.teal),
            title: Text(AppLocalizations.of(context)!.send_message_action),
            onTap: () {
              Navigator.pop(context); // Go back to chat
            },
          ),

          ListTile(
            leading: const Icon(Icons.call, color: Colors.teal),
            title: Text(AppLocalizations.of(context)!.make_call_action),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.share, color: Colors.teal),
            title: Text(AppLocalizations.of(context)!.share_contact_action),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: Text(AppLocalizations.of(context)!.delete_chat_action),
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text(AppLocalizations.of(context)!.confirm_title),
                  content: Text(AppLocalizations.of(context)!.confirm_message),
                  actions: [
                    TextButton(
                      child: Text(AppLocalizations.of(context)!.cancel_button),
                      onPressed: () => Navigator.of(ctx).pop(),
                    ),
                    TextButton(
                      child: Text(AppLocalizations.of(context)!.yes_button),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppLocalizations.of(
                                context,
                              )!.chat_deleted_snackbar,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
