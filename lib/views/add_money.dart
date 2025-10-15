import 'package:flutter/material.dart';
import 'package:revbank/widgets/app_header.dart';
import 'package:revbank/widgets/bank_details_item.dart';
import 'package:revbank/widgets/gap.dart';
import 'package:revbank/widgets/text.dart';

class AddMoney extends StatelessWidget {
  const AddMoney({
    super.key,
    required this.firstname,
    required this.lastName,
    required this.email,
    required this.number,
  });
  final String firstname;
  final String lastName;
  final String email;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const RevHeader(
        title: "Add Money",
        showBack: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.contentRegular(
            'Copy the account details below to fund your easy wallet',
            color: Colors.black,
            fontSize: 20,
          ),
          Gap.h20,
          const BankDetailsItem(
            subTitle: "Rev Bank",
            title: "Bank Name",
          ),
          BankDetailsItem(
            subTitle: number,
            title: "Account number",
            hasCopy: true,
          ),
          BankDetailsItem(
            subTitle: "$lastName $firstname",
            title: 'Account name',
          ),
        ],
      ),
    );
  }
}
