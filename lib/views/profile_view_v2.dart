import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revbank/views/profile_widget.dart';
import 'package:revbank/widgets/app_header.dart';
import 'package:revbank/widgets/gap.dart';
import 'package:revbank/widgets/text.dart';

// ignore: must_be_immutable
class ProfileViewV2 extends StatelessWidget {
  const ProfileViewV2({
    super.key,
    required this.firstname,
    required this.lastName,
    required this.email,
  });
  final String firstname;
  final String lastName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RevHeader(
        title: "Profile",
        showBack: false,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            children: [
              Container(
                height: 130,
                width: 130,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
              Gap.h20,
              AppText.heading2(
                "$firstname  "
                "$lastName",
                color: Colors.black,
                centered: true,
                fontSize: 20,
              ),
              AppText.contentRegular(
                email,
                centered: true,
              ),
              Gap.h16,
              Container(
                height: 1,
                color: Colors.grey.withOpacity(0.2),
              ),
              Gap.h30,
              ProfileWidget(
                icon: Icons.pin,
                iconColor: Colors.blue,
                title: "Create Transaction Pin",
                subtitle: "Create your Pin",
                onTap: () {},
              ),
              Gap.h30,
              ProfileWidget(
                icon: CupertinoIcons.padlock,
                iconColor: Colors.blue,
                title: "Change Password",
                subtitle: "Update your password",
                onTap: () {},
              ),
              Gap.h30,
              ProfileWidget(
                icon: Icons.support_agent_rounded,
                iconColor: Colors.green,
                title: "Support",
                subtitle: "Get support or send feedback",
                onTap: () {},
              ),
              Gap.h30,
              ProfileWidget(
                icon: CupertinoIcons.question_diamond_fill,
                iconColor: Colors.blue,
                title: "About Us",
                subtitle: "Learn More About Queens Vault",
                onTap: () {},
              ),
              Gap.h30,
              ProfileWidget(
                icon: CupertinoIcons.xmark_shield_fill,
                iconColor: Colors.orangeAccent,
                title: "Close Account",
                subtitle: "Close account",
                onTap: () {},
              ),
              Gap.h30,
              Gap.h30,
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: AppText.contentBold(
                  "Sign Out",
                  fontSize: 20,
                  centered: true,
                  color: Colors.red,
                ),
              ),
              AppText.contentRegular(
                "1.0.0",
                fontSize: 16,
                centered: true,
                letterSpacing: 4.3,
              ),
              Gap.h30,
              Gap.h30,
              Gap.h30,
            ],
          ))
        ],
      ),
    );
  }
}
