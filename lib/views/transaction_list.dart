import 'package:flutter/material.dart';
import 'package:revbank/core/router/router.dart';
import 'package:revbank/widgets/text.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateTo(RoutePaths.transaction);
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.contentBold(
                  "Debit",
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                AppText.contentRegular(
                  '₦1000',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.contentRegular(
                  "dfghjklhgf",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                AppText.contentRegular(
                  "15-10-2025",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Divider(thickness: 0.3),
        ],
      ),
    );
  }
}
