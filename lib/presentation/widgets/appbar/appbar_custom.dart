import 'package:chatapp/presentation/screens/user_info_screen.dart';
import 'package:chatapp/presentation/widgets/appbar/icon_appbar.dart';
import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String username;
  final String imagePath;
  final String lastSeen;
  final VoidCallback? onCallPressed;
  final VoidCallback? onMenuPressed;

  const AppbarCustom({
    super.key,
    required this.username,
    required this.imagePath,
    required this.lastSeen,
    this.onCallPressed,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal.shade700,
      elevation: 0,
      title: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserInfoScreen()),
          );
        },
        child: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 18),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  lastSeen,
                  style: const TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButtonCustom(
          icon: const Icon(Icons.call, color: Colors.white),
          onPressed: onCallPressed ?? () {},
        ),
        IconButtonCustom(
          icon: const Icon(Icons.view_list_sharp, color: Colors.white),
          onPressed: onMenuPressed ?? () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
