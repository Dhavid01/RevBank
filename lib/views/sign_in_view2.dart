import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revbank/core/router/navigation_service.dart';
import 'package:revbank/core/router/route_argument_keys.dart';
import 'package:revbank/core/router/route_paths.dart';
import 'package:revbank/core/utils/text_style.dart';
import 'package:revbank/core/utils/validators.dart';
import 'package:revbank/widgets/app_text_field.dart';
import 'package:revbank/widgets/gap.dart';
import 'package:revbank/widgets/my_button.dart';
import 'package:revbank/widgets/text.dart';

class SignInView2 extends ConsumerStatefulWidget {
  const SignInView2({
    super.key,
    required this.firstname,
    required this.lastName,
    required this.email,
  });
  final String firstname;
  final String lastName;
  final String email;

  @override
  ConsumerState<SignInView2> createState() => _SignInView2State();
}

class _SignInView2State extends ConsumerState<SignInView2> {
  final TextEditingController number = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final ValueNotifier<bool> buttonEnabled = ValueNotifier<bool>(false);

  checkValueUpdateButtonState() {
    if (number.text.isNotEmpty &&
        password.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty) {
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
                          "Mobile Number",
                          fontSize: 18,
                        ),
                        Gap.h10,
                        AppTextField(
                          textStyle: headingStyle3.copyWith(fontSize: 16),
                          hint: "09020971619",
                          controller: number,
                          validator: Validator.phone,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            checkValueUpdateButtonState();
                          },
                        ),
                        Gap.h20,
                        AppText.heading4(
                          "Password",
                          fontSize: 18,
                        ),
                        Gap.h10,
                        AppTextField(
                          textStyle: headingStyle3.copyWith(fontSize: 16),
                          hint: "*********",
                          controller: password,
                          isPassword: true,
                          validator: Validator.password,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            checkValueUpdateButtonState();
                          },
                        ),
                        Gap.h20,
                        AppText.heading4(
                          "Confirm Password",
                          fontSize: 18,
                        ),
                        Gap.h10,
                        AppTextField(
                          textStyle: headingStyle3.copyWith(fontSize: 16),
                          hint: "*********",
                          controller: confirmPassword,
                          isPassword: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field cannot be empty';
                            }
                            if (value.length != password.text.length) {
                              return 'Passwords do not match';
                            }
                            if (value != password.text) {
                              return 'Passwords do not Match';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            checkValueUpdateButtonState();
                          },
                        ),
                        Gap.h10,
                      ],
                    ),
                  ),
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
                                RoutePaths.dashboard,
                                argument: {
                                  RouteArgumentKeys.firstname: widget.firstname,
                                  RouteArgumentKeys.lastName: widget.lastName,
                                  RouteArgumentKeys.email: widget.email,
                                  RouteArgumentKeys.number: number.text,
                                },
                              );
                            }
                          },
                          text: "Sign Up",
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
