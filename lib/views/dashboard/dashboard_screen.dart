import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:revbank/core/utils/text_style.dart';
import 'package:revbank/views/add_money.dart';
import 'package:revbank/views/dashboard/dashboard_screen_view_model.dart';
import 'package:revbank/views/home_view.dart';
import 'package:revbank/views/profile_view_v2.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({
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
  ConsumerState<DashboardView> createState() => DashboardViewState();
}

class DashboardViewState extends ConsumerState<DashboardView> {
  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: HomeView(
            firstname: widget.firstname,
            lastName: widget.lastName,
            email: widget.email,
            number: widget.number,
          ),
          item: ItemConfig(
            icon: const Icon(
              CupertinoIcons.house,
              size: 20,
            ),
            title: "Home",
            activeColorSecondary: Colors.orangeAccent.withOpacity(0.1),
            activeForegroundColor: Colors.orangeAccent,
            inactiveForegroundColor: Colors.grey,
            textStyle: contentBoldStyle.copyWith(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: AddMoney(
            firstname: widget.firstname,
            lastName: widget.lastName,
            email: widget.email,
            number: widget.number,
          ),
          item: ItemConfig(
            icon: const Icon(
              Icons.add_circle_outline_rounded,
            ),
            title: "Add Money",
            activeColorSecondary: Colors.orangeAccent.withOpacity(0.1),
            activeForegroundColor: Colors.orangeAccent,
            inactiveForegroundColor: Colors.grey,
            textStyle: contentBoldStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ),
        PersistentTabConfig(
          screen: ProfileViewV2(
            firstname: widget.firstname,
            lastName: widget.lastName,
            email: widget.email,
          ),
          item: ItemConfig(
            icon: const Icon(
              CupertinoIcons.profile_circled,
              size: 20,
            ),
            title: "Profile",
            activeColorSecondary: Colors.orangeAccent.withOpacity(0.1),
            activeForegroundColor: Colors.orangeAccent,
            inactiveForegroundColor: Colors.grey,
            textStyle: contentRegularStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(dashboardScreenViewModel);
    return FocusScope(
      child: PopScope(
        canPop: false,
        child: PersistentTabView(
          tabs: _tabs(),
          controller: vm.persistentTabController,
          navBarHeight: 65,
          resizeToAvoidBottomInset: true,
          screenTransitionAnimation: const ScreenTransitionAnimation(
            curve: Curves.easeInToLinear,
            duration: Duration(
              milliseconds: 100,
            ),
          ),
          onTabChanged: (index) {
            setState(() {
              vm.setIndex(index);
            });
          },
          navBarBuilder: (navBarConfig) => Style8BottomNavBar(
            itemPadding: const EdgeInsets.all(10),
            navBarConfig: navBarConfig,
            navBarDecoration: const NavBarDecoration(),
          ),
        ),
      ),
    );
  }
}
