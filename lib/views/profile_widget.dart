import 'package:flutter/material.dart';
import 'package:revbank/widgets/gap.dart';
import 'package:revbank/widgets/text.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.iconColor,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1)),
            child: Icon(
              icon,
              size: 20,
              color: iconColor,
            ),
          ),
          Gap.w20,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.contentBold(
                  title,
                  color: Colors.black,
                  fontSize: 16,
                ),
                AppText.contentRegular(
                  subtitle,
                  fontSize: 14,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
          )
        ],
      ),
    );
  }
}
