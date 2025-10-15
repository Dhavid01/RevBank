import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revbank/widgets/text.dart';

class RevHeader extends ConsumerWidget implements PreferredSizeWidget {
  const RevHeader({
    super.key,
    required this.title,
    this.actions,
    this.elevation,
    this.backgroundColor,
    this.showBack = true,
  });
  final String title;
  final bool showBack;
  final Color? backgroundColor;
  final double? elevation;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: AppText.contentRegular(
        title,
        color: Colors.black,
        fontSize: 20,
        centered: true,
        letterSpacing: 0.9,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation ?? 0,
      actions: actions,
      leading: showBack
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                  left: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xffEDEFF2),
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Center(
                    child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 16,
                )),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
