import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revbank/core/app_state/app_text_field_state.dart';
import 'package:revbank/core/utils/text_style.dart';
import 'package:revbank/widgets/text.dart';

class AppTextField extends StatefulWidget {
  final String? hint;
  final String? labelText;
  final String? Function(String value)? validator;
  final TextInputType keyboardType;
  final bool isPassword;
  final List<TextInputFormatter> formatter;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final Color? hintColor;
  final Function(String)? onSubmitted;
  final int? maxLength;
  final double? height;
  final bool readOnly;
  final TextStyle? textStyle;
  late final ValueNotifier<AppTextFieldState> formState;
  final double? width;
  final FocusNode focusNode;
  final Widget? prefixIcon;
  final Widget? prefix;
  final EdgeInsets? padding;
  final TextCapitalization textCapitalization;
  final EdgeInsets? contentPadding;
  final bool enabled;
  final Function()? onTap;
  AppTextField(
      {super.key,
      this.hint,
      this.labelText,
      this.height,
      this.onTap,
      this.width,
      this.textStyle,
      FocusNode? focusNode,
      this.prefixIcon,
      this.padding,
      this.readOnly = false,
      ValueNotifier<AppTextFieldState>? formState,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.textCapitalization = TextCapitalization.none,
      this.maxLines = 1,
      this.enabled = true,
      this.minLines,
      this.prefix,
      this.hintColor,
      this.contentPadding,
      this.isPassword = false,
      this.formatter = const [],
      this.onChanged,
      this.onSubmitted,
      this.fillColor,
      this.maxLength})
      : focusNode = focusNode ?? FocusNode(),
        formState = formState ??
            ValueNotifier<AppTextFieldState>(
              AppTextFieldState.defaultValue(),
            );

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool obscure;
  late ValueNotifier<bool> hasFocus = ValueNotifier<bool>(false);
  late ValueNotifier<String?> errorState = ValueNotifier<String?>(null);

  @override
  void initState() {
    obscure = widget.isPassword;
    widget.focusNode.addListener(() {
      hasFocus.value = widget.focusNode.hasFocus;
    });
    super.initState();
  }

  toggleVisibility() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
        valueListenable: errorState,
        builder: (context, errorMessage, _) {
          return ValueListenableBuilder<bool>(
              valueListenable: hasFocus,
              builder: (context, hasFocus, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: TextFormField(
                        controller: widget.controller,
                        textCapitalization: widget.textCapitalization,
                        focusNode: widget.focusNode,
                        maxLength: widget.maxLength,
                        maxLines: widget.maxLines,
                        readOnly: widget.readOnly,
                        minLines: widget.minLines,
                        style: widget.textStyle ??
                            bodyRegularStyle.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              letterSpacing: 1.5,
                            ),
                        inputFormatters: widget.formatter,
                        onFieldSubmitted: widget.onSubmitted,
                        validator: (value) {
                          errorState.value = null;
                          String? error;

                          if (widget.validator != null) {
                            error = widget.validator!(value!);
                          }

                          errorState.value = error;
                          return error;
                        },
                        keyboardType: widget.keyboardType,
                        obscureText: obscure,
                        enabled: widget.enabled,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(fontSize: 0),
                          labelText: widget.labelText,
                          suffixIconConstraints:
                              const BoxConstraints(maxHeight: 30),
                          prefixIconConstraints:
                              const BoxConstraints(maxHeight: 25, minWidth: 40),
                          prefixIcon: widget.prefixIcon,
                          suffixIcon: widget.isPassword
                              ? IconButton(
                                  icon: Icon(
                                    obscure
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: toggleVisibility,
                                  color: Colors.grey,
                                )
                              : null,
                          isDense: true,
                          contentPadding:
                              widget.contentPadding ?? const EdgeInsets.all(15),
                          hintText: widget.hint,
                          fillColor: widget.fillColor ?? Colors.white,
                          hintStyle: bodyRegularStyle.copyWith(
                            color: Colors.grey,
                            fontSize: 16,
                            letterSpacing: 1.5,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: widget.readOnly
                                    ? Colors.grey
                                    : Colors.orangeAccent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: InputBorder.none,
                        ),
                        onChanged: widget.onChanged,
                      ),
                    ),
                    if (errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: AppText.labelRegular(
                          errorMessage.isEmpty ? errorMessage : errorMessage,
                          fontSize: 14,
                          color: Colors.red,
                          letterSpacing: 0.4,
                        ),
                      )
                  ],
                );
              });
        });
  }
}
