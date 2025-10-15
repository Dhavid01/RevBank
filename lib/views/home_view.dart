import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revbank/core/utils/text_style.dart';
import 'package:revbank/views/dashboard/dashboard_screen_view_model.dart';
import 'package:revbank/views/transaction_list.dart';
import 'package:revbank/widgets/gap.dart';
import 'package:revbank/widgets/text.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
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
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  bool showAmount = true;

  @override
  Widget build(BuildContext context) {
    final model = ref.read(dashboardScreenViewModel);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.heading3(
                        'Hi ${widget.firstname} 👋',
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                      AppText.displayRegular(
                        "Start transacting today!",
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications)
                ],
              ),
              Gap.h20,
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Gap.w20,
                        AppText.contentRegular(
                          "Your Easy Savings balance is",
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffFAFCFF),
                        ),
                        GestureDetector(
                          child: const Icon(Icons.remove_red_eye,
                              color: Colors.white),
                          onTap: () {
                            setState(() {
                              showAmount = !showAmount;
                            });
                          },
                        ),
                      ],
                    ),
                    Gap.h10,
                    AppText.heading2(
                      showAmount == true ? "₦100000" : "*******",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                    ),
                    Gap.h10,
                    InkWell(
                      onTap: () {
                        model.jumpToTab(1);
                      },
                      child: Text(
                        "View Account Details",
                        style: contentRegularStyle.copyWith(
                          shadows: [
                            const Shadow(
                                color: Colors.white, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 2.0,
                          decorationColor: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Gap.h20,
              Expanded(
                  child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText.bodyRegular(
                        "Transactions",
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                              color: const Color.fromRGBO(156, 163, 175, 1),
                            ),
                          ),
                          child: Center(
                            child: AppText.bodyRegular(
                              "See All",
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(5, (context) {
                    return const TransactionList();
                  })
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
