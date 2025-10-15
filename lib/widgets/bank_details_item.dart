// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:revbank/widgets/gap.dart';
import 'package:revbank/widgets/text.dart';

class BankDetailsItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool hasCopy;
  const BankDetailsItem({
    super.key,
    required this.title,
    required this.subTitle,
    this.hasCopy = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.output_outlined),
            Gap.w22,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.heading3(
                  title,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
                Gap.h8,
                !hasCopy
                    ? AppText.displayBold(
                        subTitle,
                        color: Colors.black.withOpacity(.8),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.displayBold(
                            subTitle,
                            color: Colors.black.withOpacity(.8),
                          ),
                          Gap.w32,
                          GestureDetector(
                              onTap: () {
                                FlutterClipboard.copy("0902097161")
                                    .then((value) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Center(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 10),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: AppText.bodyRegular(
                                            "Copied!",
                                            color: Colors.green,
                                            fontSize: 18,
                                            centered: true,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      backgroundColor: Colors.transparent,
                                      elevation: 0.0,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                });
                              },
                              child: AppText.displayBold(
                                "Copy",
                                color: Colors.red,
                              )),
                        ],
                      )
              ],
            )
          ],
        ),
      ),
    );
  }
}
