import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revbank/widgets/app_header.dart';
import 'package:revbank/widgets/gap.dart';
import 'package:revbank/widgets/my_button.dart';
import 'package:revbank/widgets/text.dart';

class TransactionSummary extends ConsumerStatefulWidget {
  const TransactionSummary({
    super.key,
  });

  @override
  ConsumerState<TransactionSummary> createState() => _TransactionSummaryState();
}

class _TransactionSummaryState extends ConsumerState<TransactionSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RevHeader(
        title: "Transactions Receipt",
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100,
                  ),
                  Gap.h10,
                  AppText.contentBold(
                    "Successful",
                    fontSize: 16.0,
                    color: Colors.green,
                    centered: true,
                  ),
                  Gap.h10,
                  AppText.contentRegular(
                    "1000",
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                    centered: true,
                  ),
                  Gap.h10,
                  AppText.contentRegular(
                    "15-10-2025",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    centered: true,
                  ),
                  Gap.h10,
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  AppText.contentRegular(
                    'Transaction details',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    centered: true,
                  ),
                  Gap.h30,
                  transactionDetails(
                    summaryTitle: 'Bank name',
                    summarySuffix: "Rev Bank",
                  ),
                  transactionDetails(
                    summaryTitle: 'Account number',
                    summarySuffix: "09020971561",
                  ),
                  transactionDetails(
                    summaryTitle: 'Account name',
                    summarySuffix: "Adesola Bidemi",
                  ),
                  transactionDetails(
                    summaryTitle: 'Transaction date',
                    summarySuffix: "15-10-2025",
                  ),
                  transactionDetails(
                      summaryTitle: 'Reference', summarySuffix: "khfgxfgchvjb"),
                  transactionDetails(
                    summaryTitle: 'Description',
                    summarySuffix: "Debit to Sola",
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MyAppButton(
                    text: "Share",
                    enabled: true,
                    color: Colors.orangeAccent,
                    textColor: Colors.white,
                    press: () async {},
                  ),
                ),
                Gap.w20,
                Expanded(
                  child: MyAppButton(
                    text: "Download",
                    color: Colors.green,
                    textColor: Colors.white,
                    press: () async {},
                  ),
                ),
              ],
            ),
            Gap.h20,
          ],
        ),
      ),
    );
  }
}

Widget transactionDetails({
  required String summaryTitle,
  required String summarySuffix,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.contentBold(
            summaryTitle,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          SizedBox(
            width: 200,
            child: AppText.contentRegular(
              summarySuffix,
              maxLines: 1,
              fontSize: 14.0,
              color: Colors.green,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      Gap.h20,
    ],
  );
}
