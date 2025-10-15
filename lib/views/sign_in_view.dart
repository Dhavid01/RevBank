import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revbank/core/router/router.dart';
import 'package:revbank/core/utils/text_style.dart';
import 'package:revbank/core/utils/validators.dart';
import 'package:revbank/widgets/app_text_field.dart';
import 'package:revbank/widgets/gap.dart';
import 'package:revbank/widgets/my_button.dart';
import 'package:revbank/widgets/text.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final ValueNotifier<bool> buttonEnabled = ValueNotifier<bool>(false);

  checkValueUpdateButtonState() {
    if (_firstName.text.isNotEmpty &&
        _lastName.text.isNotEmpty &&
        _email.text.isNotEmpty) {
      buttonEnabled.value = true;
    } else {
      buttonEnabled.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 200,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Gap.h20,
                  AppText.heading4(
                    "Signup",
                    fontSize: 18,
                  ),
                  Gap.h10,
                  AppText.contentRegular(
                    "Please fill the required fields",
                    fontSize: 12,
                  ),
                  Gap.h20,
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(0),
                      children: [
                        AppText.heading4(
                          "First Name",
                          fontSize: 18,
                        ),
                        Gap.h10,
                        AppTextField(
                          textStyle: headingStyle3.copyWith(fontSize: 16),
                          hint: "David",
                          controller: _firstName,
                          validator: Validator.singleName,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            checkValueUpdateButtonState();
                          },
                        ),
                        Gap.h20,
                        AppText.heading4(
                          "Last Name",
                          fontSize: 18,
                        ),
                        Gap.h10,
                        AppTextField(
                          textStyle: headingStyle3.copyWith(fontSize: 16),
                          hint: "Nwani",
                          controller: _lastName,
                          validator: Validator.singleName,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            checkValueUpdateButtonState();
                          },
                        ),
                        Gap.h20,
                        AppText.heading4(
                          "Email",
                          fontSize: 18,
                        ),
                        Gap.h10,
                        AppTextField(
                          textStyle: headingStyle3.copyWith(fontSize: 16),
                          hint: "johndoe@gmail.com",
                          controller: _email,
                          validator: Validator.email,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            checkValueUpdateButtonState();
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap.h10,
                  ValueListenableBuilder<bool>(
                      valueListenable: buttonEnabled,
                      builder: (context, buttonEnabled, _) {
                        return MyAppButton(
                          press: () {
                            if (_formState.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              SystemChannels.textInput
                                  .invokeMethod('TextInput.hide');
                              NavigationService.instance.navigateTo(
                                  RoutePaths.signInview2,
                                  argument: {
                                    RouteArgumentKeys.firstname:
                                        _firstName.text,
                                    RouteArgumentKeys.lastName: _lastName.text,
                                    RouteArgumentKeys.email: _email.text,
                                  });
                            }
                          },
                          text: "Continue",
                          color:
                              buttonEnabled ? Colors.orangeAccent : Colors.grey,
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
